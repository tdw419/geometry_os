; DESCRIPTION: Composite: Draws a orange circle centered at (335, 80) with radius 11 then Places a purple 64x72 rectangle at position (3, 183) then Sets a single cyan pixel at (6, 131).
; PLAN: r0=335(x), r1=80(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=183(y), r7=64(width), r8=72(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=6(x), r11=131(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 335
LDI r1, 80
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 183
LDI r7, 64
LDI r8, 72
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 6
LDI r11, 131
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
