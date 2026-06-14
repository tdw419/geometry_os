; pixel_key.asm - The Pixelpack Key Interpreter
; This program defines a 'Key' mapping system where hex values mean specific things.
;
; THE KEY:
; - Hex Letter (A-F) at Nibble 7 = Opcode.
;   - F (15) = JMP
;   - E (14) = RECTF
;   - D (13) = FILL
;   - C (12) = FRAME
; - Numbers in other nibbles:
;   - ODD (1,3,5,7,9,B,D,F) = Color mapping.
;   - EVEN (0,2,4,6,8,A,C,E) = Location mapping (snaps to grid).

; === CONSTANTS ===
LDI r31, 0xFFFFFFFF  ; Mask
LDI r30, 4           ; Nibble width
LDI r29, 28          ; LSB for Nibble 7
LDI r28, 24          ; LSB for Nibble 6
LDI r27, 20          ; LSB for Nibble 5
LDI r26, 1           ; Width 1 (parity check)

; === DATA: THE SEEDS (Blueprints) ===
; Seed 1: 0xE2410000 
; E (Opcode 14: RECTF)
; 2 (Even: X = 32)
; 4 (Even: Y = 64)
; 1 (Odd: Color = Red)
LDI r14, 0x5000
LDI r8, 0xE2410000
STORE r14, r8

; Seed 2: 0xE6830000
; E (Opcode 14: RECTF)
; 6 (Even: X = 128)
; 8 (Even: Y = 256) -> wrap to 0? let's say 256
; 3 (Odd: Color = Green)
LDI r14, 0x5001
LDI r8, 0xE6830000
STORE r14, r8

; Seed 3: 0xD0000005
; D (Opcode 13: FILL)
; 5 (Odd: Color = Blue)
LDI r14, 0x5002
LDI r8, 0xD0000005
STORE r14, r8

; === INTERPRETER LOOP ===
LDI r20, 0x5000      ; Pointer to seeds
LDI r21, 3           ; Seed count

decode_loop:
  LOAD r0, r20       ; Read current seed
  
  ; Extract Opcode (Nibble 7)
  BFE r1, r0, r30, r29
  
  ; Branch on Opcode
  CMPI r1, 15        ; 0xF = JMP
  JZ r0, op_jmp
  CMPI r1, 14        ; 0xE = RECTF
  JZ r0, op_rectf
  CMPI r1, 13        ; 0xD = FILL
  JZ r0, op_fill
  JMP next_seed

op_jmp:
  ; JMP logic: lower 24 bits as address
  LDI r2, 24
  LDI r3, 0
  BFE r4, r0, r2, r3
  ; For safety, we just set PC to r4 if it's in range? 
  ; Let's just NOP for this demo as we don't want to crash.
  JMP next_seed

op_rectf:
  ; RECTF logic: 
  ; Nibble 6 -> X (Even check)
  BFE r2, r0, r30, r28
  LDI r3, 32
  MUL r2, r3         ; Scale: 2->64, 4->128, etc.
  
  ; Nibble 5 -> Y (Even check)
  BFE r3, r0, r30, r27
  LDI r4, 32
  MUL r3, r4
  
  ; Nibble 4 -> Color (Odd check)
  LDI r4, 16
  BFE r5, r0, r30, r4
  ; Color map
  LDI r10, 1
  CMP r5, r10
  JZ r0, color_red
  LDI r10, 3
  CMP r5, r10
  JZ r0, color_green
  LDI r10, 5
  CMP r5, r10
  JZ r0, color_blue
  LDI r10, 0xFFFFFF  ; Default white
  JMP rect_draw

color_red:
  LDI r10, 0xFF0000
  JMP rect_draw
color_green:
  LDI r10, 0x00FF00
  JMP rect_draw
color_blue:
  LDI r10, 0x0000FF
  JMP rect_draw

rect_draw:
  LDI r6, 32         ; Fixed size for demo
  LDI r7, 32
  RECTF r2, r3, r6, r7, r10
  JMP next_seed

op_fill:
  ; FILL logic: extract color from lowest nibble
  LDI r2, 4
  LDI r3, 0
  BFE r4, r0, r2, r3
  ; Map color index 5 -> Blue
  CMPI r4, 5
  JZ r0, fill_blue
  LDI r10, 0x000000   ; Default black
  JMP do_fill
fill_blue:
  LDI r10, 0x0000FF
do_fill:
  FILL r10
  JMP next_seed

next_seed:
  LDI r10, 1
  ADD r20, r10        ; next seed addr
  SUB r21, r10        ; count--
  CMPI r21, 0
  JNZ r0, decode_loop

HALT
