; DESCRIPTION: Render a red object at the screen.

; meminspect.asm -- Memory Inspector for Geometry OS
;
; Phase 76: Memory Inspector
;
; Hex dump of RAM regions with ASCII alongside hex.
; Arrow keys to scroll, number keys 0-9 jump to addr*256.
;
; RAM Layout:
;   0x6000-0x60FF   String buffers
;   0x6200-0x62FF   Hex scratch
;   0x6400-0x640F   Hex digit lookup
;   0x6500          Current view address
;   0x6501          Scroll offset (rows)
;
; Screen: 14 rows of 8 bytes with hex + ASCII

#define KEY_PORT  0xFFF
#define BUF       0x6000
#define HEX_BUF   0x6200
#define HEX_TABLE 0x6400
#define VIEW_ADDR 0x6500
#define ROW_SCROLL 0x6501

LDI r30, 0xFD00
LDI r3, 1

; =========================================
; Init hex table "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48
STORE r20, r21
ADD r20, r3
LDI r21, 49
STORE r20, r21
ADD r20, r3
LDI r21, 50
STORE r20, r21
ADD r20, r3
LDI r21, 51
STORE r20, r21
ADD r20, r3
LDI r21, 52
STORE r20, r21
ADD r20, r3
LDI r21, 53
STORE r20, r21
ADD r20, r3
LDI r21, 54
STORE r20, r21
ADD r20, r3
LDI r21, 55
STORE r20, r21
ADD r20, r3
LDI r21, 56
STORE r20, r21
ADD r20, r3
LDI r21, 57
STORE r20, r21
ADD r20, r3
LDI r21, 65
STORE r20, r21
ADD r20, r3
LDI r21, 66
STORE r20, r21
ADD r20, r3
LDI r21, 67
STORE r20, r21
ADD r20, r3
LDI r21, 68
STORE r20, r21
ADD r20, r3
LDI r21, 69
STORE r20, r21
ADD r20, r3
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, VIEW_ADDR
LDI r6, 0x2000
STORE r20, r6
LDI r20, ROW_SCROLL
LDI r6, 0
STORE r20, r6

; Demo data at 0x2000
LDI r20, 0x2000
LDI r21, 72
STORE r20, r21
ADD r20, r3
LDI r21, 101
STORE r20, r21
ADD r20, r3
LDI r21, 108
STORE r20, r21
ADD r20, r3
LDI r21, 108
STORE r20, r21
ADD r20, r3
LDI r21, 111
STORE r20, r21
ADD r20, r3
LDI r21, 44
STORE r20, r21
ADD r20, r3
LDI r21, 32
STORE r20, r21
ADD r20, r3
LDI r21, 87
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r13

  LDI r11, 38
  CMP r13, r11
  JZ r5, do_up

  LDI r11, 40
  CMP r13, r11
  JZ r5, do_down

  ; Number keys 0-9
  LDI r11, 48
  CMP r13, r11
  BLT r5, do_draw

  LDI r11, 58
  CMP r13, r11
  BGE r5, do_draw

  LDI r11, 48
  SUB r13, r11
  LDI r11, 256
  MUL r13, r11
  LDI r20, VIEW_ADDR
  STORE r20, r13
  LDI r20, ROW_SCROLL
  LDI r6, 0
  STORE r20, r6
  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r6, r20
  LDI r11, 0
  CMP r6, r11
  JZ r5, do_draw
  SUB r6, r3
  STORE r20, r6
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r6, r20
  ADD r6, r3
  LDI r11, 32
  CMP r6, r11
  BGE r5, do_draw
  STORE r20, r6
  JMP do_draw

; =========================================
; DRAW
; =========================================
do_draw:
  ; Background
  LDI r1, 0x080818
  FILL r1

  ; Title bar
  LDI r1, 0
  LDI r2, 0
  LDI r0, 256
  LDI r8, 16
  LDI r14, 0x004488
  RECTF r1, r2, r0, r8, r14

  LDI r20, BUF
  STRO r20, "Memory Inspector"
  LDI r1, 30
  LDI r2, 3
  LDI r0, BUF
  LDI r8, 0xFFFFFF
  LDI r14, 0x004488
  DRAWTEXT r1, r2, r0, r8, r14

  ; Compute effective start address
  LDI r20, VIEW_ADDR
  LOAD r10, r20
  LDI r20, ROW_SCROLL
  LOAD r4, r20
  LDI r11, 8
  MUL r4, r11
  ADD r10, r4          ; r10 = start addr for display

  ; Draw 14 hex dump rows
  LDI r9, 0            ; row counter
  LDI r7, 22           ; y position

  ; Note: no CALL inside this loop, all inline

nxt_row:
  ; Build address in BUF (4 hex chars)
  LDI r21, BUF
  ; Extract nibbles from r10 (only low 16 bits for display)
  LDI r22, 12
nxt_addr_nib:
  MOV r4, r10
  MOV r16, r22
  SHR r4, r16
  LDI r16, 0xF
  AND r4, r16
  LDI r16, HEX_TABLE
  ADD r16, r4
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r3
  SUB r22, r3
  LDI r16, 0
  CMP r22, r16
  BLT r5, addr_done
  ; But we need 4 digits only (bits 15:0), so iterate 4 times with shifts 12,8,4,0
  ; Actually we want 8 hex digits for full u32
  ; Let's just do the full 8-digit address
  LDI r16, 0
  CMP r22, r16
  JNZ r5, nxt_addr_nib
addr_done:
  ; Hmm, this loop structure is wrong. Let me do it simpler.
  ; Just write 4 hex digits for the low 16 bits

  ; Actually, let me inline it simply:
  ; Build "XXXX:" where XXXX is the address in hex
  LDI r21, BUF

  ; Nibble 3 (bits 15:12)
  MOV r4, r10
  LDI r16, 12
  SHR r4, r16
  LDI r16, 0xF
  AND r4, r16
  LDI r16, HEX_TABLE
  ADD r16, r4
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r3

  ; Nibble 2 (bits 11:8)
  MOV r4, r10
  LDI r16, 8
  SHR r4, r16
  LDI r16, 0xF
  AND r4, r16
  LDI r16, HEX_TABLE
  ADD r16, r4
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r3

  ; Nibble 1 (bits 7:4)
  MOV r4, r10
  LDI r16, 4
  SHR r4, r16
  LDI r16, 0xF
  AND r4, r16
  LDI r16, HEX_TABLE
  ADD r16, r4
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r3

  ; Nibble 0 (bits 3:0)
  MOV r4, r10
  LDI r16, 0xF
  AND r4, r16
  LDI r16, HEX_TABLE
  ADD r16, r4
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r3

  ; Colon + space
  LDI r16, 58           ; ':'
  STORE r21, r16
  ADD r21, r3
  LDI r16, 32           ; ' '
  STORE r21, r16
  ADD r21, r3

  ; Read 8 bytes, write hex
  MOV r26, r10
  LDI r25, 0
nxt_byte:
  LOAD r6, r26

  ; High nibble
  LDI r1, 4
  SHR r6, r1
  LDI r1, 0xF
  AND r6, r1
  LDI r1, HEX_TABLE
  ADD r1, r6
  LOAD r1, r1
  STORE r21, r1
  ADD r21, r3

  ; Low nibble
  LOAD r6, r26
  LDI r1, 0xF
  AND r6, r1
  LDI r1, HEX_TABLE
  ADD r1, r6
  LOAD r1, r1
  STORE r21, r1
  ADD r21, r3

  ; Space
  LDI r1, 32
  STORE r21, r1
  ADD r21, r3

  ADD r26, r3
  ADD r25, r3
  LDI r1, 8
  CMP r25, r1
  BLT r5, nxt_byte

  ; " |" separator
  LDI r1, 32
  STORE r21, r1
  ADD r21, r3
  LDI r1, 124          ; '|'
  STORE r21, r1
  ADD r21, r3

  ; ASCII
  MOV r26, r10
  LDI r25, 0
nxt_ascii:
  LOAD r6, r26
  LDI r1, 32
  CMP r6, r1
  BLT r5, put_dot
  LDI r1, 127
  CMP r6, r1
  BGE r5, put_dot
  STORE r21, r6
  JMP nxt_asc2
put_dot:
  LDI r1, 46
  STORE r21, r1
nxt_asc2:
  ADD r21, r3
  ADD r26, r3
  ADD r25, r3
  LDI r1, 8
  CMP r25, r1
  BLT r5, nxt_ascii

  ; Trailing | and null
  LDI r1, 124
  STORE r21, r1
  ADD r21, r3
  LDI r1, 0
  STORE r21, r1

  ; Draw
  LDI r1, 2
  MOV r2, r7
  LDI r0, BUF
  LDI r8, 0xCCCCCC
  LDI r14, 0x080818
  DRAWTEXT r1, r2, r0, r8, r14

  ; Advance by 8
  LDI r11, 8
  ADD r10, r11
  LDI r11, 15
  ADD r7, r11
  ADD r9, r3
  LDI r11, 14
  CMP r9, r11
  BLT r5, nxt_row

  ; Status bar
  LDI r1, 0
  LDI r2, 236
  LDI r0, 256
  LDI r8, 20
  LDI r14, 0x1A1A2E
  RECTF r1, r2, r0, r8, r14

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll 0-9:Jump"
  LDI r1, 4
  LDI r2, 238
  LDI r0, BUF
  LDI r8, 0x888888
  LDI r14, 0x1A1A2E
  DRAWTEXT r1, r2, r0, r8, r14

  FRAME
  JMP main_loop
