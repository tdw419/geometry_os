; DESCRIPTION: Composite: Creates a yellow circular shape at (209, 135) with radius 75 then Sets a single blue pixel at (488, 113) then Renders a cyan box of size 45x119 starting at (442, 104).
; PLAN: r0=209(x), r1=135(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x), r6=113(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=442(x), r11=104(y), r12=45(width), r13=119(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 135
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 113
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 442
LDI r11, 104
LDI r12, 45
LDI r13, 119
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
