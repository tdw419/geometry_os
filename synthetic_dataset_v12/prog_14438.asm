; DESCRIPTION: Renders a yellow line between points (304, 14) and (302, 41).
; PLAN: r0=304(x1), r1=14(y1), r2=302(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 14
LDI r2, 302
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
