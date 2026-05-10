; DESCRIPTION: Renders a black line between points (23, 95) and (491, 183).
; PLAN: r0=23(x1), r1=95(y1), r2=491(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 95
LDI r2, 491
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
