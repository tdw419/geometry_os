; DESCRIPTION: Draw object: pos=the screen, color=red, size=fixed size.

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
LDI r6, 1

; =========================================
; Init hex table "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48
STORE r20, r21
ADD r20, r6
LDI r21, 49
STORE r20, r21
ADD r20, r6
LDI r21, 50
STORE r20, r21
ADD r20, r6
LDI r21, 51
STORE r20, r21
ADD r20, r6
LDI r21, 52
STORE r20, r21
ADD r20, r6
LDI r21, 53
STORE r20, r21
ADD r20, r6
LDI r21, 54
STORE r20, r21
ADD r20, r6
LDI r21, 55
STORE r20, r21
ADD r20, r6
LDI r21, 56
STORE r20, r21
ADD r20, r6
LDI r21, 57
STORE r20, r21
ADD r20, r6
LDI r21, 65
STORE r20, r21
ADD r20, r6
LDI r21, 66
STORE r20, r21
ADD r20, r6
LDI r21, 67
STORE r20, r21
ADD r20, r6
LDI r21, 68
STORE r20, r21
ADD r20, r6
LDI r21, 69
STORE r20, r21
ADD r20, r6
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, VIEW_ADDR
LDI r12, 0x2000
STORE r20, r12
LDI r20, ROW_SCROLL
LDI r12, 0
STORE r20, r12

; Demo data at 0x2000
LDI r20, 0x2000
LDI r21, 72
STORE r20, r21
ADD r20, r6
LDI r21, 101
STORE r20, r21
ADD r20, r6
LDI r21, 108
STORE r20, r21
ADD r20, r6
LDI r21, 108
STORE r20, r21
ADD r20, r6
LDI r21, 111
STORE r20, r21
ADD r20, r6
LDI r21, 44
STORE r20, r21
ADD r20, r6
LDI r21, 32
STORE r20, r21
ADD r20, r6
LDI r21, 87
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r14

  LDI r10, 38
  CMP r14, r10
  JZ r3, do_up

  LDI r10, 40
  CMP r14, r10
  JZ r3, do_down

  ; Number keys 0-9
  LDI r10, 48
  CMP r14, r10
  BLT r3, do_draw

  LDI r10, 58
  CMP r14, r10
  BGE r3, do_draw

  LDI r10, 48
  SUB r14, r10
  LDI r10, 256
  MUL r14, r10
  LDI r20, VIEW_ADDR
  STORE r20, r14
  LDI r20, ROW_SCROLL
  LDI r12, 0
  STORE r20, r12
  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r12, r20
  LDI r10, 0
  CMP r12, r10
  JZ r3, do_draw
  SUB r12, r6
  STORE r20, r12
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r12, r20
  ADD r12, r6
  LDI r10, 32
  CMP r12, r10
  BGE r3, do_draw
  STORE r20, r12
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
  LDI r8, 0
  LDI r7, 256
  LDI r0, 16
  LDI r13, 0x004488
  RECTF r1, r8, r7, r0, r13

  LDI r20, BUF
  STRO r20, "Memory Inspector"
  LDI r1, 30
  LDI r8, 3
  LDI r7, BUF
  LDI r0, 0xFFFFFF
  LDI r13, 0x004488
  DRAWTEXT r1, r8, r7, r0, r13

  ; Compute effective start address
  LDI r20, VIEW_ADDR
  LOAD r11, r20
  LDI r20, ROW_SCROLL
  LOAD r4, r20
  LDI r10, 8
  MUL r4, r10
  ADD r11, r4          ; r11 = start addr for display

  ; Draw 14 hex dump rows
  LDI r2, 0            ; row counter
  LDI r9, 22           ; y position

  ; Note: no CALL inside this loop, all inline

nxt_row:
  ; Build address in BUF (4 hex chars)
  LDI r21, BUF
  ; Extract nibbles from r11 (only low 16 bits for display)
  LDI r22, 12
nxt_addr_nib:
  MOV r4, r11
  MOV r16, r22
  SHR r4, r16
  LDI r16, 0xF
  AND r4, r16
  LDI r16, HEX_TABLE
  ADD r16, r4
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r6
  SUB r22, r6
  LDI r16, 0
  CMP r22, r16
  BLT r3, addr_done
  ; But we need 4 digits only (bits 15:0), so iterate 4 times with shifts 12,8,4,0
  ; Actually we want 8 hex digits for full u32
  ; Let's just do the full 8-digit address
  LDI r16, 0
  CMP r22, r16
  JNZ r3, nxt_addr_nib
addr_done:
  ; Hmm, this loop structure is wrong. Let me do it simpler.
  ; Just write 4 hex digits for the low 16 bits

  ; Actually, let me inline it simply:
  ; Build "XXXX:" where XXXX is the address in hex
  LDI r21, BUF

  ; Nibble 3 (bits 15:12)
  MOV r4, r11
  LDI r16, 12
  SHR r4, r16
  LDI r16, 0xF
  AND r4, r16
  LDI r16, HEX_TABLE
  ADD r16, r4
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r6

  ; Nibble 2 (bits 11:8)
  MOV r4, r11
  LDI r16, 8
  SHR r4, r16
  LDI r16, 0xF
  AND r4, r16
  LDI r16, HEX_TABLE
  ADD r16, r4
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r6

  ; Nibble 1 (bits 7:4)
  MOV r4, r11
  LDI r16, 4
  SHR r4, r16
  LDI r16, 0xF
  AND r4, r16
  LDI r16, HEX_TABLE
  ADD r16, r4
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r6

  ; Nibble 0 (bits 3:0)
  MOV r4, r11
  LDI r16, 0xF
  AND r4, r16
  LDI r16, HEX_TABLE
  ADD r16, r4
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r6

  ; Colon + space
  LDI r16, 58           ; ':'
  STORE r21, r16
  ADD r21, r6
  LDI r16, 32           ; ' '
  STORE r21, r16
  ADD r21, r6

  ; Read 8 bytes, write hex
  MOV r26, r11
  LDI r25, 0
nxt_byte:
  LOAD r12, r26

  ; High nibble
  LDI r1, 4
  SHR r12, r1
  LDI r1, 0xF
  AND r12, r1
  LDI r1, HEX_TABLE
  ADD r1, r12
  LOAD r1, r1
  STORE r21, r1
  ADD r21, r6

  ; Low nibble
  LOAD r12, r26
  LDI r1, 0xF
  AND r12, r1
  LDI r1, HEX_TABLE
  ADD r1, r12
  LOAD r1, r1
  STORE r21, r1
  ADD r21, r6

  ; Space
  LDI r1, 32
  STORE r21, r1
  ADD r21, r6

  ADD r26, r6
  ADD r25, r6
  LDI r1, 8
  CMP r25, r1
  BLT r3, nxt_byte

  ; " |" separator
  LDI r1, 32
  STORE r21, r1
  ADD r21, r6
  LDI r1, 124          ; '|'
  STORE r21, r1
  ADD r21, r6

  ; ASCII
  MOV r26, r11
  LDI r25, 0
nxt_ascii:
  LOAD r12, r26
  LDI r1, 32
  CMP r12, r1
  BLT r3, put_dot
  LDI r1, 127
  CMP r12, r1
  BGE r3, put_dot
  STORE r21, r12
  JMP nxt_asc2
put_dot:
  LDI r1, 46
  STORE r21, r1
nxt_asc2:
  ADD r21, r6
  ADD r26, r6
  ADD r25, r6
  LDI r1, 8
  CMP r25, r1
  BLT r3, nxt_ascii

  ; Trailing | and null
  LDI r1, 124
  STORE r21, r1
  ADD r21, r6
  LDI r1, 0
  STORE r21, r1

  ; Draw
  LDI r1, 2
  MOV r8, r9
  LDI r7, BUF
  LDI r0, 0xCCCCCC
  LDI r13, 0x080818
  DRAWTEXT r1, r8, r7, r0, r13

  ; Advance by 8
  LDI r10, 8
  ADD r11, r10
  LDI r10, 15
  ADD r9, r10
  ADD r2, r6
  LDI r10, 14
  CMP r2, r10
  BLT r3, nxt_row

  ; Status bar
  LDI r1, 0
  LDI r8, 236
  LDI r7, 256
  LDI r0, 20
  LDI r13, 0x1A1A2E
  RECTF r1, r8, r7, r0, r13

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll 0-9:Jump"
  LDI r1, 4
  LDI r8, 238
  LDI r7, BUF
  LDI r0, 0x888888
  LDI r13, 0x1A1A2E
  DRAWTEXT r1, r8, r7, r0, r13

  FRAME
  JMP main_loop
