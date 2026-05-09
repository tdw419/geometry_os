; DESCRIPTION: Places a purple line segment connecting (125, 157) to (242, 40).
; PLAN: r0=125(x1), r1=157(y1), r2=242(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 157
LDI r2, 242
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
