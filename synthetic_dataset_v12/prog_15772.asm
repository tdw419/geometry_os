; DESCRIPTION: Composite: Sets a single blue pixel at (500, 104) then Draws a purple rectangle at (269, 15) with width 82 and height 27 then Renders a black disk with center (341, 120) and radius 67.
; PLAN: r0=500(x), r1=104(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=269(x), r6=15(y), r7=82(width), r8=27(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=341(x), r11=120(y), r12=67(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 500
LDI r1, 104
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 269
LDI r6, 15
LDI r7, 82
LDI r8, 27
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 120
LDI r12, 67
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
