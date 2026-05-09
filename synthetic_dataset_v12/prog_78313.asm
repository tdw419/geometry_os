; DESCRIPTION: Places a black line segment connecting (338, 28) to (238, 226).
; PLAN: r0=338(x1), r1=28(y1), r2=238(x2), r3=226(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 28
LDI r2, 238
LDI r3, 226
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
