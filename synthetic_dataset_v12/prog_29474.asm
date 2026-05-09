; DESCRIPTION: Composite: Sets a single black pixel at (362, 11) then Draws a red circle centered at (269, 81) with radius 71 then Renders a yellow box of size 88x74 starting at (194, 149).
; PLAN: r0=362(x), r1=11(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=81(y), r7=71(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=194(x), r11=149(y), r12=88(width), r13=74(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 11
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 269
LDI r6, 81
LDI r7, 71
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 194
LDI r11, 149
LDI r12, 88
LDI r13, 74
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
