; DESCRIPTION: Renders a black line between points (90, 226) and (491, 34).
; PLAN: r0=90(x1), r1=226(y1), r2=491(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 226
LDI r2, 491
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
