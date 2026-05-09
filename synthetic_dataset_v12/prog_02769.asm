; DESCRIPTION: Composite: Creates a yellow rectangular region at (397, 111) spanning 104 by 105 pixels then Places a blue circle of radius 45 at center (402, 100).
; PLAN: r0=397(x), r1=111(y), r2=104(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=402(x), r6=100(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 397
LDI r1, 111
LDI r2, 104
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 402
LDI r6, 100
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
