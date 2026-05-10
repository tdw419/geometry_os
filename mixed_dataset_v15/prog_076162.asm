; DESCRIPTION: Places a blue line segment connecting (478, 22) to (502, 20).
; PLAN: r0=478(x1), r1=22(y1), r2=502(x2), r3=20(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 22
LDI r2, 502
LDI r3, 20
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
