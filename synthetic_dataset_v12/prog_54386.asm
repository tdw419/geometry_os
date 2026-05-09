; DESCRIPTION: Renders a green line between points (149, 141) and (316, 8).
; PLAN: r0=149(x1), r1=141(y1), r2=316(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 141
LDI r2, 316
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
