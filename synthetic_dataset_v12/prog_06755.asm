; DESCRIPTION: Places a black line segment connecting (96, 151) to (318, 184).
; PLAN: r0=96(x1), r1=151(y1), r2=318(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 151
LDI r2, 318
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
