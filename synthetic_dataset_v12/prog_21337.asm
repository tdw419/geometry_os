; DESCRIPTION: Composite: Creates a orange rectangular region at (98, 189) spanning 61 by 31 pixels then Creates a purple circular shape at (137, 185) with radius 54 then Places a blue dot at position (173, 179).
; PLAN: r0=98(x), r1=189(y), r2=61(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=137(x), r6=185(y), r7=54(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=173(x), r11=179(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 98
LDI r1, 189
LDI r2, 61
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 185
LDI r7, 54
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 173
LDI r11, 179
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
