; DESCRIPTION: Places a yellow line segment connecting (33, 96) to (140, 109).
; PLAN: r0=33(x1), r1=96(y1), r2=140(x2), r3=109(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 96
LDI r2, 140
LDI r3, 109
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
