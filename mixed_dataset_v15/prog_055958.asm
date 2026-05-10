; DESCRIPTION: Renders a white line between points (407, 86) and (443, 159).
; PLAN: r0=407(x1), r1=86(y1), r2=443(x2), r3=159(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 86
LDI r2, 443
LDI r3, 159
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
