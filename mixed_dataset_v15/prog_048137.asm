; DESCRIPTION: Composite: Sets a single cyan pixel at (3, 68) then Creates a blue circular shape at (131, 183) with radius 36 then Draws a orange rectangle at (486, 73) with width 22 and height 70.
; PLAN: r0=3(x), r1=68(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=183(y), r7=36(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x), r11=73(y), r12=22(width), r13=70(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 3
LDI r1, 68
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 131
LDI r6, 183
LDI r7, 36
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 73
LDI r12, 22
LDI r13, 70
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
