; DESCRIPTION: Composite: Sets a single blue pixel at (394, 163) then Draws a magenta rectangle at (85, 124) with width 105 and height 15 then Renders a orange disk with center (352, 82) and radius 78.
; PLAN: r0=394(x), r1=163(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=85(x), r6=124(y), r7=105(width), r8=15(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=352(x), r11=82(y), r12=78(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 394
LDI r1, 163
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 85
LDI r6, 124
LDI r7, 105
LDI r8, 15
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 352
LDI r11, 82
LDI r12, 78
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
