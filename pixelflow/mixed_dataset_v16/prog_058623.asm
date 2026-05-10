; DESCRIPTION: Places a yellow line segment connecting (134, 90) to (253, 24).
; PLAN: r0=134(x1), r1=90(y1), r2=253(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 90
LDI r2, 253
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
