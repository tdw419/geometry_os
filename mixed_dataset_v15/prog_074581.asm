; DESCRIPTION: Composite: Sets a single green pixel at (375, 209) then Creates a cyan circular shape at (56, 153) with radius 48 then Draws a cyan rectangle at (148, 8) with width 28 and height 104.
; PLAN: r0=375(x), r1=209(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=56(x), r6=153(y), r7=48(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=148(x), r11=8(y), r12=28(width), r13=104(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 375
LDI r1, 209
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 56
LDI r6, 153
LDI r7, 48
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 148
LDI r11, 8
LDI r12, 28
LDI r13, 104
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
