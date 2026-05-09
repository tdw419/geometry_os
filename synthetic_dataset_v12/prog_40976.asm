; DESCRIPTION: Places a blue line segment connecting (74, 165) to (63, 185).
; PLAN: r0=74(x1), r1=165(y1), r2=63(x2), r3=185(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 165
LDI r2, 63
LDI r3, 185
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
