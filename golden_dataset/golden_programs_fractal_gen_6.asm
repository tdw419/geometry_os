; DESCRIPTION: Geometry OS program to draw a colored object.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r6, 1
LDI r2, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r9, 0

y_loop:
  LDI r0, 0

  x_loop:
    MOV r7, r0
    AND r7, r9
    JNZ r7, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r12, r9
    JNZ r12, not_top
    LDI r12, 0xFF0000
    JMP have_color
    not_top:
    MOV r12, r0
    JNZ r12, not_left
    LDI r12, 0xFFFF00
    JMP have_color
    not_left:
    LDI r12, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r3, 80
    STORE r2, r3
    ADD r2, r6
    LDI r3, 83
    STORE r2, r3
    ADD r2, r6
    LDI r3, 69
    STORE r2, r3
    ADD r2, r6
    LDI r3, 84
    STORE r2, r3
    ADD r2, r6
    LDI r3, 73
    STORE r2, r3
    ADD r2, r6
    LDI r3, 32
    STORE r2, r3
    ADD r2, r6

    ; X coord = x * 32 as decimal
    MOV r3, r0
    LDI r16, 32
    MUL r3, r16
    CALL write_dec

    LDI r3, 44
    STORE r2, r3
    ADD r2, r6

    ; Y coord = y * 32 as decimal
    MOV r3, r9
    LDI r16, 32
    MUL r3, r16
    CALL write_dec

    LDI r3, 44
    STORE r2, r3
    ADD r2, r6

    ; Color as hex "0xHHHHHH"
    LDI r3, 48
    STORE r2, r3
    ADD r2, r6
    LDI r3, 120
    STORE r2, r3
    ADD r2, r6

    ; Write 6 hex nibbles from r12
    PUSH r31
    PUSH r12
    PUSH r4
    LDI r4, 20
    hex_loop:
      MOV r3, r12
      MOV r16, r4
      SHR r3, r16
      LDI r16, 15
      AND r3, r16
      LDI r16, 10
      CMP r3, r16
      BGE r5, hex_alpha
      LDI r16, 48
      ADD r3, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r3, r16
      hex_write:
      STORE r2, r3
      ADD r2, r6
      LDI r3, 4
      SUB r4, r3
      LDI r3, 31
      MOV r16, r4
      SAR r16, r3
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r4
    POP r12
    POP r31

    LDI r3, 10
    STORE r2, r3
    ADD r2, r6

    skip_pixel:
    ADD r0, r6
    LDI r3, 8
    CMP r0, r3
    BLT r5, x_loop

  ADD r9, r6
  LDI r3, 8
  CMP r9, r3
  BLT r5, y_loop

; Write HALT
LDI r3, 72
STORE r2, r3
ADD r2, r6
LDI r3, 65
STORE r2, r3
ADD r2, r6
LDI r3, 76
STORE r2, r3
ADD r2, r6
LDI r3, 84
STORE r2, r3
ADD r2, r6
LDI r3, 0
STORE r2, r3

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r3 = number (0-255)
;       r2 = canvas position (advances)
;       r6 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r3, wd_nonzero
  LDI r3, 48
  STORE r2, r3
  ADD r2, r6
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r3
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r2, r17
  ADD r2, r6
  MOV r17, r3
  DIV r17, r16
  MUL r17, r16
  SUB r3, r17
  wd_tens:
  LDI r16, 10
  MOV r17, r3
  DIV r17, r16
  LDI r18, 48
  ADD r17, r18
  STORE r2, r17
  ADD r2, r6
  MOV r17, r3
  DIV r17, r16
  MUL r17, r16
  SUB r3, r17
  LDI r16, 48
  ADD r3, r16
  STORE r2, r3
  ADD r2, r6
  wd_done:
  POP r31
  RET
