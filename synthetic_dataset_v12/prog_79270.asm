; DESCRIPTION: Draws a magenta line from (144, 152) to (64, 130).
; PLAN: r0=144(x1), r1=152(y1), r2=64(x2), r3=130(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 152
LDI r2, 64
LDI r3, 130
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
