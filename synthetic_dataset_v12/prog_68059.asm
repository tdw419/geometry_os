; DESCRIPTION: Draws a magenta line from (266, 76) to (436, 10).
; PLAN: r0=266(x1), r1=76(y1), r2=436(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 76
LDI r2, 436
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
