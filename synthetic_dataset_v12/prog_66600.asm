; DESCRIPTION: Draws a magenta line from (157, 40) to (436, 218).
; PLAN: r0=157(x1), r1=40(y1), r2=436(x2), r3=218(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 40
LDI r2, 436
LDI r3, 218
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
