; DESCRIPTION: Composite: Sets a single cyan pixel at (454, 128) then Creates a black rectangular region at (49, 14) spanning 85 by 100 pixels then Places a white circle of radius 33 at center (150, 38).
; PLAN: r0=454(x), r1=128(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=49(x), r6=14(y), r7=85(width), r8=100(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=150(x), r11=38(y), r12=33(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 454
LDI r1, 128
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 14
LDI r7, 85
LDI r8, 100
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 38
LDI r12, 33
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
