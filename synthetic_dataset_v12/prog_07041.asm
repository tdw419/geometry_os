; DESCRIPTION: Composite: Creates a red rectangular region at (155, 90) spanning 117 by 44 pixels then Draws a orange circle centered at (428, 184) with radius 71 then Places a magenta dot at position (374, 109).
; PLAN: r0=155(x), r1=90(y), r2=117(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=428(x), r6=184(y), r7=71(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=109(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 90
LDI r2, 117
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 428
LDI r6, 184
LDI r7, 71
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 109
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
