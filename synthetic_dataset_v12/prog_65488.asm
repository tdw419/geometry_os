; DESCRIPTION: Renders a black line between points (91, 76) and (501, 109).
; PLAN: r0=91(x1), r1=76(y1), r2=501(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 76
LDI r2, 501
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
