; DESCRIPTION: Places a yellow line segment connecting (189, 98) to (4, 226).
; PLAN: r0=189(x1), r1=98(y1), r2=4(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 98
LDI r2, 4
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
