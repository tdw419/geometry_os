; DESCRIPTION: Places a green line segment connecting (22, 138) to (49, 219).
; PLAN: r0=22(x1), r1=138(y1), r2=49(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 138
LDI r2, 49
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
