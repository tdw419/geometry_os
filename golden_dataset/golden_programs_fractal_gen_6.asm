; DESCRIPTION: This GeOS assembly code generates a Sierpinski triangle by iterating over an 8x8 grid and coloring pixels based on the condition `(x AND y) == 0`. It writes PSETI instructions to a canvas buffer, self-assembles the code, and runs it to render the fractal.

; fractal_gen.asm - Self-Modifying Fractal Generator
;
; Generates a Sierpinski triangle by computing which pixels to color
; and writing PSETI assembly instructions to the canvas buffer.
; Then self-assembles and runs the generated code.
;
; Algorithm - pixel (x,y) is colored if (x AND y) equals 0
; 8x8 grid, each cell 32x32 pixels. About 36 colored pixels.

LDI r1, 1
LDI r12, 0x8000
LDI r30, 0xFF00

; Main loop - iterate 8x8 grid
LDI r13, 0

y_loop:
  LDI r6, 0

  x_loop:
    MOV r7, r6
    AND r7, r13
    JNZ r7, skip_pixel

    ; Color - red if y==0, yellow if x==0, green otherwise
    MOV r5, r13
    JNZ r5, not_top
    LDI r5, 0xFF0000
    JMP have_color
    not_top:
    MOV r5, r6
    JNZ r5, not_left
    LDI r5, 0xFFFF00
    JMP have_color
    not_left:
    LDI r5, 0x00FF00
    have_color:

    ; Write "PSETI XX,YY,0xHHHHHH\n" to canvas
    LDI r0, 80
    STORE r12, r0
    ADD r12, r1
    LDI r0, 83
    STORE r12, r0
    ADD r12, r1
    LDI r0, 69
    STORE r12, r0
    ADD r12, r1
    LDI r0, 84
    STORE r12, r0
    ADD r12, r1
    LDI r0, 73
    STORE r12, r0
    ADD r12, r1
    LDI r0, 32
    STORE r12, r0
    ADD r12, r1

    ; X coord = x * 32 as decimal
    MOV r0, r6
    LDI r16, 32
    MUL r0, r16
    CALL write_dec

    LDI r0, 44
    STORE r12, r0
    ADD r12, r1

    ; Y coord = y * 32 as decimal
    MOV r0, r13
    LDI r16, 32
    MUL r0, r16
    CALL write_dec

    LDI r0, 44
    STORE r12, r0
    ADD r12, r1

    ; Color as hex "0xHHHHHH"
    LDI r0, 48
    STORE r12, r0
    ADD r12, r1
    LDI r0, 120
    STORE r12, r0
    ADD r12, r1

    ; Write 6 hex nibbles from r5
    PUSH r31
    PUSH r5
    PUSH r2
    LDI r2, 20
    hex_loop:
      MOV r0, r5
      MOV r16, r2
      SHR r0, r16
      LDI r16, 15
      AND r0, r16
      LDI r16, 10
      CMP r0, r16
      BGE r4, hex_alpha
      LDI r16, 48
      ADD r0, r16
      JMP hex_write
      hex_alpha:
      LDI r16, 55
      ADD r0, r16
      hex_write:
      STORE r12, r0
      ADD r12, r1
      LDI r0, 4
      SUB r2, r0
      LDI r0, 31
      MOV r16, r2
      SAR r16, r0
      JNZ r16, hex_done
      JMP hex_loop
    hex_done:
    POP r2
    POP r5
    POP r31

    LDI r0, 10
    STORE r12, r0
    ADD r12, r1

    skip_pixel:
    ADD r6, r1
    LDI r0, 8
    CMP r6, r0
    BLT r4, x_loop

  ADD r13, r1
  LDI r0, 8
  CMP r13, r0
  BLT r4, y_loop

; Write HALT
LDI r0, 72
STORE r12, r0
ADD r12, r1
LDI r0, 65
STORE r12, r0
ADD r12, r1
LDI r0, 76
STORE r12, r0
ADD r12, r1
LDI r0, 84
STORE r12, r0
ADD r12, r1
LDI r0, 0
STORE r12, r0

; Self-assemble and run
ASMSELF
RUNNEXT

; Subroutine - write decimal number to canvas
; Input r0 = number (0-255)
;       r12 = canvas position (advances)
;       r1 = 1
; Clobbers r16, r17, r18
write_dec:
  PUSH r31
  JNZ r0, wd_nonzero
  LDI r0, 48
  STORE r12, r0
  ADD r12, r1
  JMP wd_done
  wd_nonzero:
  LDI r16, 100
  MOV r17, r0
  DIV r17, r16
  JZ r17, wd_tens
  LDI r18, 48
  ADD r17, r18
  STORE r12, r17
  ADD r12, r1
  MOV r17, r0
  DIV r17, r16
  MUL r17, r16
  SUB r0, r17
  wd_tens:
  LDI r16, 10
  MOV r17, r0
  DIV r17, r16
  LDI r18, 48
  ADD r17, r18
  STORE r12, r17
  ADD r12, r1
  MOV r17, r0
  DIV r17, r16
  MUL r17, r16
  SUB r0, r17
  LDI r16, 48
  ADD r0, r16
  STORE r12, r0
  ADD r12, r1
  wd_done:
  POP r31
  RET
