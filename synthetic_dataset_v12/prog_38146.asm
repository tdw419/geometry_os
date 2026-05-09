; DESCRIPTION: Composite: Draws a yellow circle centered at (271, 134) with radius 74 then Creates a green rectangular region at (409, 114) spanning 74 by 96 pixels.
; PLAN: r0=271(x), r1=134(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=114(y), r7=74(width), r8=96(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 134
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 114
LDI r7, 74
LDI r8, 96
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
