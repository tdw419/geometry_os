; DESCRIPTION: Composite: . Then Creates a purple circular shape at (105, 124) with radius 74. Then Draws a purple rectangle at (27, 188) with width 104 and height 17.
; PLAN: r0=105(x), r1=124(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=27(x), r1=188(y), r2=104(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple circular shape at (105, 124) with radius 74.
; PLAN: r0=105(x), r1=124(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 124
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple rectangle at (27, 188) with width 104 and height 17.
; PLAN: r0=27(x), r1=188(y), r2=104(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 188
LDI r2, 104
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
