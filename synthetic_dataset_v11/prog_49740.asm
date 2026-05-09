; DESCRIPTION: Composite: . Then Renders a white disk with center (175, 165) and radius 71. Then Places a red line segment connecting (9, 51) to (40, 159).
; PLAN: r0=175(x), r1=165(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=9(x1), r1=51(y1), r2=40(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (175, 165) and radius 71.
; PLAN: r0=175(x), r1=165(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 165
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red line segment connecting (9, 51) to (40, 159).
; PLAN: r0=9(x1), r1=51(y1), r2=40(x2), r3=159(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 51
LDI r2, 40
LDI r3, 159
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
