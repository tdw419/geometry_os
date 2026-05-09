; DESCRIPTION: Composite: Draws a black rectangle at (124, 184) with width 44 and height 54 then Renders a red disk with center (357, 202) and radius 53 then Sets a single orange pixel at (443, 83).
; PLAN: r0=124(x), r1=184(y), r2=44(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=357(x), r6=202(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=443(x), r11=83(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 124
LDI r1, 184
LDI r2, 44
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 202
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 443
LDI r11, 83
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
