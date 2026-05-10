; DESCRIPTION: Composite: Places a yellow dot at position (31, 230) then Renders a black box of size 33x52 starting at (160, 182) then Draws a red circle centered at (379, 56) with radius 19.
; PLAN: r0=31(x), r1=230(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=160(x), r6=182(y), r7=33(width), r8=52(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=379(x), r11=56(y), r12=19(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 230
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 160
LDI r6, 182
LDI r7, 33
LDI r8, 52
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 379
LDI r11, 56
LDI r12, 19
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
