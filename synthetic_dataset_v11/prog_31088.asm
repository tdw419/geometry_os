; DESCRIPTION: Composite: . Then Renders a orange line between points (149, 200) and (121, 203). Then Sets a single black pixel at (200, 129).
; PLAN: r0=149(x1), r1=200(y1), r2=121(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=200(x), r1=129(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (149, 200) and (121, 203).
; PLAN: r0=149(x1), r1=200(y1), r2=121(x2), r3=203(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 200
LDI r2, 121
LDI r3, 203
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (200, 129).
; PLAN: r0=200(x), r1=129(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 200
LDI r1, 129
LDI r2, 0x000000
PSET r0, r1, r2
HALT
