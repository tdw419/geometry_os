; DESCRIPTION: Places a yellow line segment connecting (358, 69) to (436, 63).
; PLAN: r0=358(x1), r1=69(y1), r2=436(x2), r3=63(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 69
LDI r2, 436
LDI r3, 63
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
