; DESCRIPTION: Draws a magenta line from (76, 71) to (490, 52).
; PLAN: r0=76(x1), r1=71(y1), r2=490(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 71
LDI r2, 490
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
