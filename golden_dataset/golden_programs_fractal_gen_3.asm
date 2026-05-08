; DESCRIPTION: Render a colored object at the screen.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r9, 1
LDI r2, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r13, 0

y_loop:
  LDI r5, 0

  x_loop:
    MOV r15, r5
    AND r15, r13
    JNZ r15, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r3, r13
    JNZ r3, not_top
    LDI r3, 0xFF0000
    JMP have_color
    not_top:
    MOV r3, r5
    JNZ r3, not_left
    LDI r3, 0xFFFF00
    JMP have_color
    not_left:
    LDI r3, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r8, 80
    STORE r2, r8
    ADD r2, r9
    LDI r8, 83
    STORE r2, r8
    ADD r2, r9
    LDI r8, 69
    STORE r2, r8
    ADD r2, r9
    LDI r8, 84
    STORE r2, r8
    ADD r2, r9
    LDI r8, 73
    STORE r2, r8
    ADD r2, r9
    LDI r8, 32
    STORE r2, r8
    ADD r2, r9

    ; X coord = x * 32 as decimal
    MOV r8, r5
    LDI r16, 32
    MUL r8, r16
    CALL write_dec

    LDI r8, 44
    STORE r2, r8
    ADD r2, r9

    ; Y coord = y * 32 as decimal
    MOV r8, r13
    LDI r16, 32
    MUL r8, r16
    CALL write_dec

    LDI r8, 44
    STORE r2, r8
    ADD r2, r9

    ; Color as hex "0xHHHHHH"
    LDI r8, 48
    STORE r2, r8
    ADD r2, r9
    LDI r8, 120
    STORE r2, r8
    ADD r2, r9

    ; Write 6 hex nibbles from r3
    PUSH r31
    PUSH r3
    PUSH r1
    LDI r1, 20
    hex_loop:
      MOV r8, r3
      MOV r16, r1
      SHR r8, r16
      LDI r16, 15
      AND r8, r16
      LDI r16, 10
      CMP r8, r16
      BGE r4, hex_alpha
      LDI r16, 48
      ADD r8, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r8, r16
      hex_write:
      STORE r2, r8
      ADD r2, r9
      LDI r8, 4
      SUB r1, r8
      LDI r8, 31
      MOV r16, r1
      SAR r16, r8
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r1
    POP r3
    POP r31

    LDI r8, 10
    STORE r2, r8
    ADD r2, r9

    skip_pixel:
    ADD r5, r9
    LDI r8, 8
    CMP r5, r8
    BLT r4, x_loop

  ADD r13, r9
  LDI r8, 8
  CMP r13, r8
  BLT r4, y_loop

; Write HALT
LDI r8, 72
STORE r2, r8
ADD r2, r9
LDI r8, 65
STORE r2, r8
ADD r2, r9
LDI r8, 76
STORE r2, r8
ADD r2, r9
LDI r8, 84
STORE r2, r8
ADD r2, r9
LDI r8, 0
STORE r2, r8

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r8 = number (0-255)
;       r2 = canvas position (advances)
;       r9 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r8, wd_nonzero
  LDI r8, 48
  STORE r2, r8
  ADD r2, r9
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r8
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r2, r17
  ADD r2, r9
  MOV r17, r8
  DIV r17, r16
  MUL r17, r16
  SUB r8, r17
  wd_tens:
  LDI r16, 10
  MOV r17, r8
  DIV r17, r16
  LDI r18, 48
  ADD r17, r18
  STORE r2, r17
  ADD r2, r9
  MOV r17, r8
  DIV r17, r16
  MUL r17, r16
  SUB r8, r17
  LDI r16, 48
  ADD r8, r16
  STORE r2, r8
  ADD r2, r9
  wd_done:
  POP r31
  RET
