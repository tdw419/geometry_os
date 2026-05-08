; DESCRIPTION: A red object centered at the screen with fixed size.

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
LDI r7, 1

; =========================================
; Init hex table "0123456789ABCDEF"
; =========================================
LDI r20, HEX_TABLE
LDI r21, 48
STORE r20, r21
ADD r20, r7
LDI r21, 49
STORE r20, r21
ADD r20, r7
LDI r21, 50
STORE r20, r21
ADD r20, r7
LDI r21, 51
STORE r20, r21
ADD r20, r7
LDI r21, 52
STORE r20, r21
ADD r20, r7
LDI r21, 53
STORE r20, r21
ADD r20, r7
LDI r21, 54
STORE r20, r21
ADD r20, r7
LDI r21, 55
STORE r20, r21
ADD r20, r7
LDI r21, 56
STORE r20, r21
ADD r20, r7
LDI r21, 57
STORE r20, r21
ADD r20, r7
LDI r21, 65
STORE r20, r21
ADD r20, r7
LDI r21, 66
STORE r20, r21
ADD r20, r7
LDI r21, 67
STORE r20, r21
ADD r20, r7
LDI r21, 68
STORE r20, r21
ADD r20, r7
LDI r21, 69
STORE r20, r21
ADD r20, r7
LDI r21, 70
STORE r20, r21

; Init state
LDI r20, VIEW_ADDR
LDI r8, 0x2000
STORE r20, r8
LDI r20, ROW_SCROLL
LDI r8, 0
STORE r20, r8

; Demo data at 0x2000
LDI r20, 0x2000
LDI r21, 72
STORE r20, r21
ADD r20, r7
LDI r21, 101
STORE r20, r21
ADD r20, r7
LDI r21, 108
STORE r20, r21
ADD r20, r7
LDI r21, 108
STORE r20, r21
ADD r20, r7
LDI r21, 111
STORE r20, r21
ADD r20, r7
LDI r21, 44
STORE r20, r21
ADD r20, r7
LDI r21, 32
STORE r20, r21
ADD r20, r7
LDI r21, 87
STORE r20, r21

; =========================================
; MAIN LOOP
; =========================================
main_loop:
  IKEY r2

  LDI r6, 38
  CMP r2, r6
  JZ r15, do_up

  LDI r6, 40
  CMP r2, r6
  JZ r15, do_down

  ; Number keys 0-9
  LDI r6, 48
  CMP r2, r6
  BLT r15, do_draw

  LDI r6, 58
  CMP r2, r6
  BGE r15, do_draw

  LDI r6, 48
  SUB r2, r6
  LDI r6, 256
  MUL r2, r6
  LDI r20, VIEW_ADDR
  STORE r20, r2
  LDI r20, ROW_SCROLL
  LDI r8, 0
  STORE r20, r8
  JMP do_draw

do_up:
  LDI r20, ROW_SCROLL
  LOAD r8, r20
  LDI r6, 0
  CMP r8, r6
  JZ r15, do_draw
  SUB r8, r7
  STORE r20, r8
  JMP do_draw

do_down:
  LDI r20, ROW_SCROLL
  LOAD r8, r20
  ADD r8, r7
  LDI r6, 32
  CMP r8, r6
  BGE r15, do_draw
  STORE r20, r8
  JMP do_draw

; =========================================
; DRAW
; =========================================
do_draw:
  ; Background
  LDI r0, 0x080818
  FILL r0

  ; Title bar
  LDI r0, 0
  LDI r4, 0
  LDI r11, 256
  LDI r13, 16
  LDI r3, 0x004488
  RECTF r0, r4, r11, r13, r3

  LDI r20, BUF
  STRO r20, "Memory Inspector"
  LDI r0, 30
  LDI r4, 3
  LDI r11, BUF
  LDI r13, 0xFFFFFF
  LDI r3, 0x004488
  DRAWTEXT r0, r4, r11, r13, r3

  ; Compute effective start address
  LDI r20, VIEW_ADDR
  LOAD r1, r20
  LDI r20, ROW_SCROLL
  LOAD r12, r20
  LDI r6, 8
  MUL r12, r6
  ADD r1, r12          ; r1 = start addr for display

  ; Draw 14 hex dump rows
  LDI r9, 0            ; row counter
  LDI r14, 22           ; y position

  ; Note: no CALL inside this loop, all inline

nxt_row:
  ; Build address in BUF (4 hex chars)
  LDI r21, BUF
  ; Extract nibbles from r1 (only low 16 bits for display)
  LDI r22, 12
nxt_addr_nib:
  MOV r12, r1
  MOV r16, r22
  SHR r12, r16
  LDI r16, 0xF
  AND r12, r16
  LDI r16, HEX_TABLE
  ADD r16, r12
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r7
  SUB r22, r7
  LDI r16, 0
  CMP r22, r16
  BLT r15, addr_done
  ; But we need 4 digits only (bits 15:0), so iterate 4 times with shifts 12,8,4,0
  ; Actually we want 8 hex digits for full u32
  ; Let's just do the full 8-digit address
  LDI r16, 0
  CMP r22, r16
  JNZ r15, nxt_addr_nib
addr_done:
  ; Hmm, this loop structure is wrong. Let me do it simpler.
  ; Just write 4 hex digits for the low 16 bits

  ; Actually, let me inline it simply:
  ; Build "XXXX:" where XXXX is the address in hex
  LDI r21, BUF

  ; Nibble 3 (bits 15:12)
  MOV r12, r1
  LDI r16, 12
  SHR r12, r16
  LDI r16, 0xF
  AND r12, r16
  LDI r16, HEX_TABLE
  ADD r16, r12
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r7

  ; Nibble 2 (bits 11:8)
  MOV r12, r1
  LDI r16, 8
  SHR r12, r16
  LDI r16, 0xF
  AND r12, r16
  LDI r16, HEX_TABLE
  ADD r16, r12
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r7

  ; Nibble 1 (bits 7:4)
  MOV r12, r1
  LDI r16, 4
  SHR r12, r16
  LDI r16, 0xF
  AND r12, r16
  LDI r16, HEX_TABLE
  ADD r16, r12
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r7

  ; Nibble 0 (bits 3:0)
  MOV r12, r1
  LDI r16, 0xF
  AND r12, r16
  LDI r16, HEX_TABLE
  ADD r16, r12
  LOAD r16, r16
  STORE r21, r16
  ADD r21, r7

  ; Colon + space
  LDI r16, 58           ; ':'
  STORE r21, r16
  ADD r21, r7
  LDI r16, 32           ; ' '
  STORE r21, r16
  ADD r21, r7

  ; Read 8 bytes, write hex
  MOV r26, r1
  LDI r25, 0
nxt_byte:
  LOAD r8, r26

  ; High nibble
  LDI r0, 4
  SHR r8, r0
  LDI r0, 0xF
  AND r8, r0
  LDI r0, HEX_TABLE
  ADD r0, r8
  LOAD r0, r0
  STORE r21, r0
  ADD r21, r7

  ; Low nibble
  LOAD r8, r26
  LDI r0, 0xF
  AND r8, r0
  LDI r0, HEX_TABLE
  ADD r0, r8
  LOAD r0, r0
  STORE r21, r0
  ADD r21, r7

  ; Space
  LDI r0, 32
  STORE r21, r0
  ADD r21, r7

  ADD r26, r7
  ADD r25, r7
  LDI r0, 8
  CMP r25, r0
  BLT r15, nxt_byte

  ; " |" separator
  LDI r0, 32
  STORE r21, r0
  ADD r21, r7
  LDI r0, 124          ; '|'
  STORE r21, r0
  ADD r21, r7

  ; ASCII
  MOV r26, r1
  LDI r25, 0
nxt_ascii:
  LOAD r8, r26
  LDI r0, 32
  CMP r8, r0
  BLT r15, put_dot
  LDI r0, 127
  CMP r8, r0
  BGE r15, put_dot
  STORE r21, r8
  JMP nxt_asc2
put_dot:
  LDI r0, 46
  STORE r21, r0
nxt_asc2:
  ADD r21, r7
  ADD r26, r7
  ADD r25, r7
  LDI r0, 8
  CMP r25, r0
  BLT r15, nxt_ascii

  ; Trailing | and null
  LDI r0, 124
  STORE r21, r0
  ADD r21, r7
  LDI r0, 0
  STORE r21, r0

  ; Draw
  LDI r0, 2
  MOV r4, r14
  LDI r11, BUF
  LDI r13, 0xCCCCCC
  LDI r3, 0x080818
  DRAWTEXT r0, r4, r11, r13, r3

  ; Advance by 8
  LDI r6, 8
  ADD r1, r6
  LDI r6, 15
  ADD r14, r6
  ADD r9, r7
  LDI r6, 14
  CMP r9, r6
  BLT r15, nxt_row

  ; Status bar
  LDI r0, 0
  LDI r4, 236
  LDI r11, 256
  LDI r13, 20
  LDI r3, 0x1A1A2E
  RECTF r0, r4, r11, r13, r3

  LDI r20, BUF
  STRO r20, "Up/Dn:Scroll 0-9:Jump"
  LDI r0, 4
  LDI r4, 238
  LDI r11, BUF
  LDI r13, 0x888888
  LDI r3, 0x1A1A2E
  DRAWTEXT r0, r4, r11, r13, r3

  FRAME
  JMP main_loop
