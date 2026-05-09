; DESCRIPTION: Places a black line segment connecting (471, 15) to (96, 206).
; PLAN: r0=471(x1), r1=15(y1), r2=96(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 15
LDI r2, 96
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
