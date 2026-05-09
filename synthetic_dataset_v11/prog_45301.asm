; DESCRIPTION: Places a black line segment connecting (80, 80) to (233, 21).
; PLAN: r0=80(x1), r1=80(y1), r2=233(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 80
LDI r2, 233
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
