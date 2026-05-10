; DESCRIPTION: Composite: Sets a single black pixel at (237, 86) then Renders a red disk with center (258, 62) and radius 41 then Creates a blue rectangular region at (101, 138) spanning 19 by 109 pixels.
; PLAN: r0=237(x), r1=86(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=258(x), r6=62(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=101(x), r11=138(y), r12=19(width), r13=109(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 86
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 258
LDI r6, 62
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 101
LDI r11, 138
LDI r12, 19
LDI r13, 109
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
