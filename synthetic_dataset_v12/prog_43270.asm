; DESCRIPTION: Renders a black line between points (492, 155) and (228, 35).
; PLAN: r0=492(x1), r1=155(y1), r2=228(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 155
LDI r2, 228
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
