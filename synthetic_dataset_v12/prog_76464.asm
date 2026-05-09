; DESCRIPTION: Composite: Places a white dot at position (266, 243) then Creates a magenta rectangular region at (211, 151) spanning 15 by 23 pixels then Creates a blue circular shape at (374, 69) with radius 54.
; PLAN: r0=266(x), r1=243(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=151(y), r7=15(width), r8=23(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=374(x), r11=69(y), r12=54(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 266
LDI r1, 243
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 151
LDI r7, 15
LDI r8, 23
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 69
LDI r12, 54
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
