; DESCRIPTION: Renders a orange line between points (253, 241) and (339, 197).
; PLAN: r0=253(x1), r1=241(y1), r2=339(x2), r3=197(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 241
LDI r2, 339
LDI r3, 197
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
