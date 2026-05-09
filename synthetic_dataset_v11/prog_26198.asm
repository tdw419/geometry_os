; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (166, 131) with radius 69. Then Renders a orange line between points (96, 7) and (183, 2).
; PLAN: r0=166(x), r1=131(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=96(x1), r1=7(y1), r2=183(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (166, 131) with radius 69.
; PLAN: r0=166(x), r1=131(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 131
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a orange line between points (96, 7) and (183, 2).
; PLAN: r0=96(x1), r1=7(y1), r2=183(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 7
LDI r2, 183
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
