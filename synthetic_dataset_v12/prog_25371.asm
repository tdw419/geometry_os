; DESCRIPTION: Renders a black line between points (484, 52) and (60, 30).
; PLAN: r0=484(x1), r1=52(y1), r2=60(x2), r3=30(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 52
LDI r2, 60
LDI r3, 30
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
