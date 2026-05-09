; DESCRIPTION: Places a black line segment connecting (33, 183) to (12, 90).
; PLAN: r0=33(x1), r1=183(y1), r2=12(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 183
LDI r2, 12
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
