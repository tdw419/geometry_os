; DESCRIPTION: Renders a yellow line between points (47, 164) and (212, 4).
; PLAN: r0=47(x1), r1=164(y1), r2=212(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 164
LDI r2, 212
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
