; DESCRIPTION: Renders a orange line between points (373, 246) and (258, 238).
; PLAN: r0=373(x1), r1=246(y1), r2=258(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 246
LDI r2, 258
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
