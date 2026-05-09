; DESCRIPTION: Composite: Draws a blue circle centered at (398, 199) with radius 34 then Places a purple 67x21 rectangle at position (105, 124).
; PLAN: r0=398(x), r1=199(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=124(y), r7=67(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 199
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 124
LDI r7, 67
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
