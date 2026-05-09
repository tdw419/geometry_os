; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (109, 89) with radius 74. Then Draws a blue rectangle at (10, 194) with width 92 and height 12.
; PLAN: r0=109(x), r1=89(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=10(x), r1=194(y), r2=92(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow circular shape at (109, 89) with radius 74.
; PLAN: r0=109(x), r1=89(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 89
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue rectangle at (10, 194) with width 92 and height 12.
; PLAN: r0=10(x), r1=194(y), r2=92(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 194
LDI r2, 92
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
