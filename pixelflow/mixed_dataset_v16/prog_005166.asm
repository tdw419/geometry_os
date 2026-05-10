; DESCRIPTION: Composite: Draws a purple circle centered at (215, 193) with radius 30 then Renders a white box of size 76x53 starting at (356, 104).
; PLAN: r0=215(x), r1=193(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=356(x), r6=104(y), r7=76(width), r8=53(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 193
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 356
LDI r6, 104
LDI r7, 76
LDI r8, 53
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
