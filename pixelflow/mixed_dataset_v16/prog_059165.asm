; DESCRIPTION: Renders a yellow line between points (111, 104) and (41, 227).
; PLAN: r0=111(x1), r1=104(y1), r2=41(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 104
LDI r2, 41
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
