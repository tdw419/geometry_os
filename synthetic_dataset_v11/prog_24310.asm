; DESCRIPTION: Draws a magenta line from (252, 248) to (16, 15).
; PLAN: r0=252(x1), r1=248(y1), r2=16(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 248
LDI r2, 16
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
