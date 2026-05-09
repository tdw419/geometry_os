; DESCRIPTION: Places a blue line segment connecting (13, 210) to (129, 37).
; PLAN: r0=13(x1), r1=210(y1), r2=129(x2), r3=37(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 210
LDI r2, 129
LDI r3, 37
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
