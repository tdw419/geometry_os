; DESCRIPTION: Places a green line segment connecting (65, 175) to (165, 185).
; PLAN: r0=65(x1), r1=175(y1), r2=165(x2), r3=185(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 175
LDI r2, 165
LDI r3, 185
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
