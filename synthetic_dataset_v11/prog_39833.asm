; DESCRIPTION: Composite: . Then Renders a black disk with center (79, 40) and radius 17. Then Renders a green line between points (118, 165) and (69, 109).
; PLAN: r0=79(x), r1=40(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=118(x1), r1=165(y1), r2=69(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black disk with center (79, 40) and radius 17.
; PLAN: r0=79(x), r1=40(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 40
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green line between points (118, 165) and (69, 109).
; PLAN: r0=118(x1), r1=165(y1), r2=69(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 165
LDI r2, 69
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
