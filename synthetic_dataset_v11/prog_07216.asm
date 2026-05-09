; DESCRIPTION: Renders a red line between points (184, 109) and (227, 225).
; PLAN: r0=184(x1), r1=109(y1), r2=227(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 109
LDI r2, 227
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
