; DESCRIPTION: Composite: Sets a single blue pixel at (62, 101) then Renders a purple disk with center (206, 117) and radius 55 then Draws a cyan rectangle at (179, 16) with width 117 and height 17.
; PLAN: r0=62(x), r1=101(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=206(x), r6=117(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=179(x), r11=16(y), r12=117(width), r13=17(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 101
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 206
LDI r6, 117
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 179
LDI r11, 16
LDI r12, 117
LDI r13, 17
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
