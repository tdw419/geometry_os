; DESCRIPTION: Geometry OS program to draw a colored object.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r4, 1
LDI r0, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r1, 0

y_loop:
  LDI r13, 0

  x_loop:
    MOV r6, r13
    AND r6, r1
    JNZ r6, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r2, r1
    JNZ r2, not_top
    LDI r2, 0xFF0000
    JMP have_color
    not_top:
    MOV r2, r13
    JNZ r2, not_left
    LDI r2, 0xFFFF00
    JMP have_color
    not_left:
    LDI r2, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r12, 80
    STORE r0, r12
    ADD r0, r4
    LDI r12, 83
    STORE r0, r12
    ADD r0, r4
    LDI r12, 69
    STORE r0, r12
    ADD r0, r4
    LDI r12, 84
    STORE r0, r12
    ADD r0, r4
    LDI r12, 73
    STORE r0, r12
    ADD r0, r4
    LDI r12, 32
    STORE r0, r12
    ADD r0, r4

    ; X coord = x * 32 as decimal
    MOV r12, r13
    LDI r16, 32
    MUL r12, r16
    CALL write_dec

    LDI r12, 44
    STORE r0, r12
    ADD r0, r4

    ; Y coord = y * 32 as decimal
    MOV r12, r1
    LDI r16, 32
    MUL r12, r16
    CALL write_dec

    LDI r12, 44
    STORE r0, r12
    ADD r0, r4

    ; Color as hex "0xHHHHHH"
    LDI r12, 48
    STORE r0, r12
    ADD r0, r4
    LDI r12, 120
    STORE r0, r12
    ADD r0, r4

    ; Write 6 hex nibbles from r2
    PUSH r31
    PUSH r2
    PUSH r10
    LDI r10, 20
    hex_loop:
      MOV r12, r2
      MOV r16, r10
      SHR r12, r16
      LDI r16, 15
      AND r12, r16
      LDI r16, 10
      CMP r12, r16
      BGE r15, hex_alpha
      LDI r16, 48
      ADD r12, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r12, r16
      hex_write:
      STORE r0, r12
      ADD r0, r4
      LDI r12, 4
      SUB r10, r12
      LDI r12, 31
      MOV r16, r10
      SAR r16, r12
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r10
    POP r2
    POP r31

    LDI r12, 10
    STORE r0, r12
    ADD r0, r4

    skip_pixel:
    ADD r13, r4
    LDI r12, 8
    CMP r13, r12
    BLT r15, x_loop

  ADD r1, r4
  LDI r12, 8
  CMP r1, r12
  BLT r15, y_loop

; Write HALT
LDI r12, 72
STORE r0, r12
ADD r0, r4
LDI r12, 65
STORE r0, r12
ADD r0, r4
LDI r12, 76
STORE r0, r12
ADD r0, r4
LDI r12, 84
STORE r0, r12
ADD r0, r4
LDI r12, 0
STORE r0, r12

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r12 = number (0-255)
;       r0 = canvas position (advances)
;       r4 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r12, wd_nonzero
  LDI r12, 48
  STORE r0, r12
  ADD r0, r4
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r12
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r0, r17
  ADD r0, r4
  MOV r17, r12
  DIV r17, r16
  MUL r17, r16
  SUB r12, r17
  wd_tens:
  LDI r16, 10
  MOV r17, r12
  DIV r17, r16
  LDI r18, 48
  ADD r17, r18
  STORE r0, r17
  ADD r0, r4
  MOV r17, r12
  DIV r17, r16
  MUL r17, r16
  SUB r12, r17
  LDI r16, 48
  ADD r12, r16
  STORE r0, r12
  ADD r0, r4
  wd_done:
  POP r31
  RET
