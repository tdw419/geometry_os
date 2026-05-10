; DESCRIPTION: Composite: Places a orange dot at position (231, 22) then Renders a black disk with center (140, 180) and radius 76 then Draws a orange rectangle at (357, 127) with width 104 and height 109.
; PLAN: r0=231(x), r1=22(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=140(x), r6=180(y), r7=76(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=357(x), r11=127(y), r12=104(width), r13=109(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 22
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 140
LDI r6, 180
LDI r7, 76
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 357
LDI r11, 127
LDI r12, 104
LDI r13, 109
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
