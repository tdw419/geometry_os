; DESCRIPTION: Places a yellow line segment connecting (185, 210) to (151, 49).
; PLAN: r0=185(x1), r1=210(y1), r2=151(x2), r3=49(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 210
LDI r2, 151
LDI r3, 49
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
