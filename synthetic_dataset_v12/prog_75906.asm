; DESCRIPTION: Places a black line segment connecting (176, 29) to (24, 180).
; PLAN: r0=176(x1), r1=29(y1), r2=24(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 29
LDI r2, 24
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
