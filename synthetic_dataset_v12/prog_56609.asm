; DESCRIPTION: Places a blue line segment connecting (174, 85) to (426, 8).
; PLAN: r0=174(x1), r1=85(y1), r2=426(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 85
LDI r2, 426
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
