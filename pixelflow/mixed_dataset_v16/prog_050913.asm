; DESCRIPTION: Composite: Creates a black circular shape at (164, 125) with radius 39 then Creates a blue rectangular region at (300, 6) spanning 111 by 110 pixels then Places a white dot at position (470, 179).
; PLAN: r0=164(x), r1=125(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=300(x), r6=6(y), r7=111(width), r8=110(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=470(x), r11=179(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 125
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 300
LDI r6, 6
LDI r7, 111
LDI r8, 110
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 179
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
