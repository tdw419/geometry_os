; DESCRIPTION: Places a yellow line segment connecting (262, 225) to (106, 41).
; PLAN: r0=262(x1), r1=225(y1), r2=106(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 225
LDI r2, 106
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
