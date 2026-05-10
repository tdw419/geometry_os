; DESCRIPTION: Renders a black line between points (157, 145) and (443, 73).
; PLAN: r0=157(x1), r1=145(y1), r2=443(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 145
LDI r2, 443
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
