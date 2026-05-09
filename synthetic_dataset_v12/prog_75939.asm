; DESCRIPTION: Renders a yellow line between points (138, 106) and (104, 95).
; PLAN: r0=138(x1), r1=106(y1), r2=104(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 106
LDI r2, 104
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
