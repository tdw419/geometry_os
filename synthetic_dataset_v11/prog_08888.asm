; DESCRIPTION: Places a black line segment connecting (7, 171) to (80, 233).
; PLAN: r0=7(x1), r1=171(y1), r2=80(x2), r3=233(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 171
LDI r2, 80
LDI r3, 233
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
