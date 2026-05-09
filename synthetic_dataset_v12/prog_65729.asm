; DESCRIPTION: Composite: Creates a blue rectangular region at (402, 157) spanning 104 by 90 pixels then Places a white circle of radius 24 at center (233, 69).
; PLAN: r0=402(x), r1=157(y), r2=104(width), r3=90(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=69(y), r7=24(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 402
LDI r1, 157
LDI r2, 104
LDI r3, 90
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 69
LDI r7, 24
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
