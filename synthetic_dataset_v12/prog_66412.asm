; DESCRIPTION: Renders a red line between points (258, 225) and (2, 73).
; PLAN: r0=258(x1), r1=225(y1), r2=2(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 225
LDI r2, 2
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
