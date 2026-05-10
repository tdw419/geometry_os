; DESCRIPTION: Composite: Places a yellow dot at position (459, 97) then Renders a green disk with center (111, 179) and radius 61 then Draws a orange rectangle at (380, 191) with width 91 and height 36.
; PLAN: r0=459(x), r1=97(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=111(x), r6=179(y), r7=61(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=380(x), r11=191(y), r12=91(width), r13=36(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 97
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 111
LDI r6, 179
LDI r7, 61
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 380
LDI r11, 191
LDI r12, 91
LDI r13, 36
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
