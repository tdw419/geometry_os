; DESCRIPTION: Places a magenta line segment connecting (477, 119) to (310, 65).
; PLAN: r0=477(x1), r1=119(y1), r2=310(x2), r3=65(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 119
LDI r2, 310
LDI r3, 65
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
