; DESCRIPTION: Composite: . Then Renders a black line between points (12, 178) and (162, 246). Then Renders a orange disk with center (158, 179) and radius 53.
; PLAN: r0=12(x1), r1=178(y1), r2=162(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=158(x), r1=179(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a black line between points (12, 178) and (162, 246).
; PLAN: r0=12(x1), r1=178(y1), r2=162(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 178
LDI r2, 162
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (158, 179) and radius 53.
; PLAN: r0=158(x), r1=179(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 179
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
