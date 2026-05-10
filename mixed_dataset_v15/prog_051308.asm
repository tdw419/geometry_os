; DESCRIPTION: Composite: Sets a single purple pixel at (232, 152) then Renders a green disk with center (86, 167) and radius 73 then Draws a yellow rectangle at (428, 25) with width 49 and height 96.
; PLAN: r0=232(x), r1=152(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=86(x), r6=167(y), r7=73(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=428(x), r11=25(y), r12=49(width), r13=96(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 152
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 86
LDI r6, 167
LDI r7, 73
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 428
LDI r11, 25
LDI r12, 49
LDI r13, 96
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
