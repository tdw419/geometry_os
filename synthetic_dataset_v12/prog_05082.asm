; DESCRIPTION: Renders a black line between points (212, 141) and (37, 109).
; PLAN: r0=212(x1), r1=141(y1), r2=37(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 141
LDI r2, 37
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
