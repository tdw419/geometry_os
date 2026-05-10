; DESCRIPTION: Renders a yellow line between points (104, 231) and (41, 118).
; PLAN: r0=104(x1), r1=231(y1), r2=41(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 231
LDI r2, 41
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
