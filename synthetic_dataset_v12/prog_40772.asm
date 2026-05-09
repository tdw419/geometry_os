; DESCRIPTION: Places a green line segment connecting (12, 91) to (96, 226).
; PLAN: r0=12(x1), r1=91(y1), r2=96(x2), r3=226(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 91
LDI r2, 96
LDI r3, 226
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
