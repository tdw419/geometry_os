; DESCRIPTION: Draws a magenta line from (324, 244) to (232, 11).
; PLAN: r0=324(x1), r1=244(y1), r2=232(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 244
LDI r2, 232
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
