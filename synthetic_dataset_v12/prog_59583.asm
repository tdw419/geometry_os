; DESCRIPTION: Places a black line segment connecting (500, 151) to (421, 114).
; PLAN: r0=500(x1), r1=151(y1), r2=421(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 151
LDI r2, 421
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
