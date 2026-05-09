; DESCRIPTION: Places a green line segment connecting (35, 13) to (96, 106).
; PLAN: r0=35(x1), r1=13(y1), r2=96(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 13
LDI r2, 96
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
