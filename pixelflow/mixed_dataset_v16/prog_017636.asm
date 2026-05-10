; DESCRIPTION: Renders a black line between points (164, 159) and (76, 184).
; PLAN: r0=164(x1), r1=159(y1), r2=76(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 159
LDI r2, 76
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
