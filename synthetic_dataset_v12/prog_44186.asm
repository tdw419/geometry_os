; DESCRIPTION: Places a yellow line segment connecting (35, 49) to (107, 226).
; PLAN: r0=35(x1), r1=49(y1), r2=107(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 49
LDI r2, 107
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
