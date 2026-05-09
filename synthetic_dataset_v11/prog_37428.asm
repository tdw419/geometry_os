; DESCRIPTION: Draws a magenta line from (232, 62) to (15, 49).
; PLAN: r0=232(x1), r1=62(y1), r2=15(x2), r3=49(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 62
LDI r2, 15
LDI r3, 49
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
