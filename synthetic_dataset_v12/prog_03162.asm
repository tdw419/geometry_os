; DESCRIPTION: Places a black line segment connecting (157, 240) to (7, 124).
; PLAN: r0=157(x1), r1=240(y1), r2=7(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 240
LDI r2, 7
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
