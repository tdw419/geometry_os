; DESCRIPTION: Draws a magenta line from (11, 52) to (364, 5).
; PLAN: r0=11(x1), r1=52(y1), r2=364(x2), r3=5(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 52
LDI r2, 364
LDI r3, 5
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
