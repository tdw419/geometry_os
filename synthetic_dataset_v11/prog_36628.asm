; DESCRIPTION: Composite: . Then Draws a blue circle centered at (103, 175) with radius 74. Then Renders a white box of size 54x55 starting at (92, 104).
; PLAN: r0=103(x), r1=175(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=92(x), r1=104(y), r2=54(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (103, 175) with radius 74.
; PLAN: r0=103(x), r1=175(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 103
LDI r1, 175
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a white box of size 54x55 starting at (92, 104).
; PLAN: r0=92(x), r1=104(y), r2=54(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 104
LDI r2, 54
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
