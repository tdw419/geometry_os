; DESCRIPTION: Composite: . Then Draws a blue rectangle at (55, 163) with width 25 and height 34. Then Creates a yellow circular shape at (138, 139) with radius 65.
; PLAN: r0=55(x), r1=163(y), r2=25(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=138(x), r1=139(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a blue rectangle at (55, 163) with width 25 and height 34.
; PLAN: r0=55(x), r1=163(y), r2=25(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 163
LDI r2, 25
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (138, 139) with radius 65.
; PLAN: r0=138(x), r1=139(y), r2=65(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 139
LDI r2, 65
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
