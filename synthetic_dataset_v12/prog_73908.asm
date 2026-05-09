; DESCRIPTION: Composite: Sets a single blue pixel at (22, 1) then Draws a purple circle centered at (57, 179) with radius 47 then Draws a red rectangle at (457, 173) with width 12 and height 39.
; PLAN: r0=22(x), r1=1(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=57(x), r6=179(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=457(x), r11=173(y), r12=12(width), r13=39(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 22
LDI r1, 1
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 57
LDI r6, 179
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 457
LDI r11, 173
LDI r12, 12
LDI r13, 39
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
