; DESCRIPTION: Composite: Creates a magenta rectangular region at (175, 129) spanning 104 by 77 pixels then Renders a orange disk with center (68, 117) and radius 61 then Places a black dot at position (472, 56).
; PLAN: r0=175(x), r1=129(y), r2=104(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=117(y), r7=61(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=472(x), r11=56(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 175
LDI r1, 129
LDI r2, 104
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 117
LDI r7, 61
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 472
LDI r11, 56
LDI r12, 0x000000
PSET r10, r11, r12
HALT
