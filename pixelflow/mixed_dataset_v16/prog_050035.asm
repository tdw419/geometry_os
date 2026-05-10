; DESCRIPTION: Renders a yellow line between points (105, 24) and (443, 30).
; PLAN: r0=105(x1), r1=24(y1), r2=443(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 24
LDI r2, 443
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
