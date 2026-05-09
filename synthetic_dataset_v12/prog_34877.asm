; DESCRIPTION: Composite: Sets a single black pixel at (69, 183) then Renders a yellow disk with center (469, 64) and radius 28 then Renders a yellow box of size 88x116 starting at (161, 28).
; PLAN: r0=69(x), r1=183(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=469(x), r6=64(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x), r11=28(y), r12=88(width), r13=116(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 183
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 469
LDI r6, 64
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 28
LDI r12, 88
LDI r13, 116
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
