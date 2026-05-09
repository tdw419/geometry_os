; DESCRIPTION: Composite: . Then Places a red line segment connecting (120, 233) to (88, 141). Then Renders a red disk with center (88, 53) and radius 18.
; PLAN: r0=120(x1), r1=233(y1), r2=88(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=88(x), r1=53(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (120, 233) to (88, 141).
; PLAN: r0=120(x1), r1=233(y1), r2=88(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 233
LDI r2, 88
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red disk with center (88, 53) and radius 18.
; PLAN: r0=88(x), r1=53(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 53
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
