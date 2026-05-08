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
LDI r15, 1

; =========================================
; Init hex table "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48
STORE r20, r21
ADD r20, r15
LDI r21, 49
STORE r20, r21
ADD r20, r15
LDI r21, 50
STORE r20, r21
ADD r20, r15
LDI r21, 51
STORE r20, r21
ADD r20, r15
LDI r21, 52
STORE r20, r21
ADD r20, r15
LDI r21, 53
STORE r20, r21
ADD r20, r15
LDI r21, 54
STORE r20, r21
ADD r20, r15
LDI r21, 55
STORE r20, r21
ADD r20, r15
LDI r21, 56
STORE r20, r21
ADD r20, r15
LDI r21, 57
STORE r20, r21
ADD r20, r15
LDI r21, 65
STORE r20, r21
ADD r20, r15
LDI r21, 66
STORE r20, r21
ADD r20, r15
LDI r21, 67
STORE r20, r21
ADD r20, r15
LDI r21, 68
STORE r20, r21
ADD r20, r15
LDI r21, 69
STORE r20, r21
ADD r20, r15
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, VIEW_ADDR
LDI r11, 0x2000
STORE r20, r11
LDI r20, ROW_SCROLL
LDI r11, 0
STORE r20, r11

; Demo data at 0x2000
LDI r20, 0x2000
LDI r21, 72
STORE r20, r21
ADD r20, r15
LDI r21, 101
STORE r20, r21
ADD r20, r15
LDI r21, 108
STORE r20, r21
ADD r20, r15
LDI r21, 108
STORE r20, r21
ADD r20, r15
LDI r21, 111
STORE r20, r21
ADD r20, r15
LDI r21, 44
STORE r20, r21
ADD r20, r15
LDI r21, 32
STORE r20, r21
ADD r20, r15
LDI r21, 87
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r13

  LDI r4, 38
  CMP r13, r4
  JZ r1, do_up

  LDI r4, 40
  CMP r13, r4
  JZ r1, do_down

  ; Number keys 0-9
  LDI r4, 48
  CMP r13, r4
  BLT r1, do_draw

  LDI r4, 58
  CMP r13, r4
  BGE r1, do_draw

  LDI r4, 48
  SUB r13, r4
  LDI r4, 256
  MUL r13, r4
  LDI r20, VIEW_ADDR
  STORE r20, r13
  LDI r20, ROW_SCROLL
  LDI r11, 0
  STORE r20, r11
  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r11, r20
  LDI r4, 0
  CMP r11, r4
  JZ r1, do_draw
  SUB r11, r15
  STORE r20, r11
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r11, r20
  ADD r11, r15
  LDI r4, 32
  CMP r11, r4
  BGE r1, do_draw
  STORE r20, r11
  JMP do_draw

; =========================================
; DRAW
; =========================================
do_draw:
  ; Background
  LDI r10, 0x080818
  FILL r10

  ; Title bar
  LDI r10, 0
  LDI r12, 0
  LDI r0, 256
  LDI r2, 16
  LDI r5, 0x004488
  RECTF r10, r12, r0, r2, r5

  LDI r20, BUF
  STRO r20, "Memory Inspector"
  LDI r10, 30
  LDI r12, 3
  LDI r0, BUF
  LDI r2, 0xFFFFFF
  LDI r5, 0x004488
  DRAWTEXT r10, r12, r0, r2, r5

  ; Compute effective start address
  LDI r20, VIEW_ADDR
  LOAD r14, r20
  LDI r20, ROW_SCROLL
  LOAD r9, r20
  LDI r4, 8
  MUL r9, r4
  ADD r14, r9          ; r14 = start addr for display

  ; Draw 14 hex dump rows
  LDI r6, 0            ; row counter
  LDI r8, 22           ; y position

  ; Note: no CALL inside this loop, all inline

nxt_row:
  ; Build address in BUF (4 hex chars)
  LDI r21, BUF
  ; Extract nibbles from r14 (only low 16 bits for display)
  LDI r22, 12
nxt_addr_nib:
  MOV r9, r14
  MOV r16, r22
  SHR r9, r16
  LDI r16, 0xF
  AND r9, r16
  LDI r16, HEX_TABLE
  ADD r16, r9
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r15
  SUB r22, r15
  LDI r16, 0
  CMP r22, r16
  BLT r1, addr_done
  ; But we need 4 digits only (bits 15:0), so iterate 4 times with shifts 12,8,4,0
  ; Actually we want 8 hex digits for full u32
  ; Let's just do the full 8-digit address
  LDI r16, 0
  CMP r22, r16
  JNZ r1, nxt_addr_nib
addr_done:
  ; Hmm, this loop structure is wrong. Let me do it simpler.
  ; Just write 4 hex digits for the low 16 bits

  ; Actually, let me inline it simply:
  ; Build "XXXX:" where XXXX is the address in hex
  LDI r21, BUF

  ; Nibble 3 (bits 15:12)
  MOV r9, r14
  LDI r16, 12
  SHR r9, r16
  LDI r16, 0xF
  AND r9, r16
  LDI r16, HEX_TABLE
  ADD r16, r9
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r15

  ; Nibble 2 (bits 11:8)
  MOV r9, r14
  LDI r16, 8
  SHR r9, r16
  LDI r16, 0xF
  AND r9, r16
  LDI r16, HEX_TABLE
  ADD r16, r9
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r15

  ; Nibble 1 (bits 7:4)
  MOV r9, r14
  LDI r16, 4
  SHR r9, r16
  LDI r16, 0xF
  AND r9, r16
  LDI r16, HEX_TABLE
  ADD r16, r9
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r15

  ; Nibble 0 (bits 3:0)
  MOV r9, r14
  LDI r16, 0xF
  AND r9, r16
  LDI r16, HEX_TABLE
  ADD r16, r9
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r15

  ; Colon + space
  LDI r16, 58           ; ':'
  STORE r21, r16
  ADD r21, r15
  LDI r16, 32           ; ' '
  STORE r21, r16
  ADD r21, r15

  ; Read 8 bytes, write hex
  MOV r26, r14
  LDI r25, 0
nxt_byte:
  LOAD r11, r26

  ; High nibble
  LDI r10, 4
  SHR r11, r10
  LDI r10, 0xF
  AND r11, r10
  LDI r10, HEX_TABLE
  ADD r10, r11
  LOAD r10, r10
  STORE r21, r10
  ADD r21, r15

  ; Low nibble
  LOAD r11, r26
  LDI r10, 0xF
  AND r11, r10
  LDI r10, HEX_TABLE
  ADD r10, r11
  LOAD r10, r10
  STORE r21, r10
  ADD r21, r15

  ; Space
  LDI r10, 32
  STORE r21, r10
  ADD r21, r15

  ADD r26, r15
  ADD r25, r15
  LDI r10, 8
  CMP r25, r10
  BLT r1, nxt_byte

  ; " |" separator
  LDI r10, 32
  STORE r21, r10
  ADD r21, r15
  LDI r10, 124          ; '|'
  STORE r21, r10
  ADD r21, r15

  ; ASCII
  MOV r26, r14
  LDI r25, 0
nxt_ascii:
  LOAD r11, r26
  LDI r10, 32
  CMP r11, r10
  BLT r1, put_dot
  LDI r10, 127
  CMP r11, r10
  BGE r1, put_dot
  STORE r21, r11
  JMP nxt_asc2
put_dot:
  LDI r10, 46
  STORE r21, r10
nxt_asc2:
  ADD r21, r15
  ADD r26, r15
  ADD r25, r15
  LDI r10, 8
  CMP r25, r10
  BLT r1, nxt_ascii

  ; Trailing | and null
  LDI r10, 124
  STORE r21, r10
  ADD r21, r15
  LDI r10, 0
  STORE r21, r10

  ; Draw
  LDI r10, 2
  MOV r12, r8
  LDI r0, BUF
  LDI r2, 0xCCCCCC
  LDI r5, 0x080818
  DRAWTEXT r10, r12, r0, r2, r5

  ; Advance by 8
  LDI r4, 8
  ADD r14, r4
  LDI r4, 15
  ADD r8, r4
  ADD r6, r15
  LDI r4, 14
  CMP r6, r4
  BLT r1, nxt_row

  ; Status bar
  LDI r10, 0
  LDI r12, 236
  LDI r0, 256
  LDI r2, 20
  LDI r5, 0x1A1A2E
  RECTF r10, r12, r0, r2, r5

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll 0-9:Jump"
  LDI r10, 4
  LDI r12, 238
  LDI r0, BUF
  LDI r2, 0x888888
  LDI r5, 0x1A1A2E
  DRAWTEXT r10, r12, r0, r2, r5

  FRAME
  JMP main_loop
