; DESCRIPTION: Places a black line segment connecting (142, 128) to (47, 52).
; PLAN: r0=142(x1), r1=128(y1), r2=47(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 128
LDI r2, 47
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
