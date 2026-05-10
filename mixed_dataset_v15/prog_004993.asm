; DESCRIPTION: Renders a magenta line between points (119, 41) and (139, 13).
; PLAN: r0=119(x1), r1=41(y1), r2=139(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 41
LDI r2, 139
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
