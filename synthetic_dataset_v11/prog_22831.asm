; DESCRIPTION: Places a yellow line segment connecting (143, 9) to (185, 226).
; PLAN: r0=143(x1), r1=9(y1), r2=185(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 9
LDI r2, 185
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
