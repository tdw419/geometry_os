; DESCRIPTION: Composite: Sets a single purple pixel at (41, 141) then Draws a purple circle centered at (105, 163) with radius 48 then Renders a black box of size 48x25 starting at (254, 54).
; PLAN: r0=41(x), r1=141(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=105(x), r6=163(y), r7=48(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=254(x), r11=54(y), r12=48(width), r13=25(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 41
LDI r1, 141
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 105
LDI r6, 163
LDI r7, 48
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 254
LDI r11, 54
LDI r12, 48
LDI r13, 25
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
