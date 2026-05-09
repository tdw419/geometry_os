; DESCRIPTION: Composite: Renders a blue box of size 108x118 starting at (330, 4) then Renders a black disk with center (114, 121) and radius 38 then Places a orange dot at position (129, 173).
; PLAN: r0=330(x), r1=4(y), r2=108(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=121(y), r7=38(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=129(x), r11=173(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 330
LDI r1, 4
LDI r2, 108
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 121
LDI r7, 38
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 129
LDI r11, 173
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
