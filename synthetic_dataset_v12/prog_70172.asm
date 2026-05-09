; DESCRIPTION: Renders a green line between points (43, 199) and (2, 109).
; PLAN: r0=43(x1), r1=199(y1), r2=2(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 199
LDI r2, 2
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
