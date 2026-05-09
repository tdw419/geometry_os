; DESCRIPTION: Composite: Places a yellow dot at position (376, 8) then Draws a black rectangle at (275, 78) with width 36 and height 111 then Renders a black disk with center (187, 195) and radius 30.
; PLAN: r0=376(x), r1=8(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=275(x), r6=78(y), r7=36(width), r8=111(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=187(x), r11=195(y), r12=30(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 376
LDI r1, 8
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 275
LDI r6, 78
LDI r7, 36
LDI r8, 111
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 195
LDI r12, 30
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
