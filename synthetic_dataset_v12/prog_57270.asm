; DESCRIPTION: Composite: Renders a black disk with center (366, 64) and radius 43 then Creates a green rectangular region at (100, 140) spanning 39 by 69 pixels then Places a white dot at position (470, 181).
; PLAN: r0=366(x), r1=64(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=100(x), r6=140(y), r7=39(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=470(x), r11=181(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 366
LDI r1, 64
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 100
LDI r6, 140
LDI r7, 39
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 181
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
