; DESCRIPTION: Places a blue line segment connecting (86, 25) to (37, 223).
; PLAN: r0=86(x1), r1=25(y1), r2=37(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 25
LDI r2, 37
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
