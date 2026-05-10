; DESCRIPTION: Composite: Places a blue circle of radius 53 at center (96, 164) then Places a purple 105x104 rectangle at position (320, 65) then Sets a single purple pixel at (506, 76).
; PLAN: r0=96(x), r1=164(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x), r6=65(y), r7=105(width), r8=104(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=506(x), r11=76(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 164
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 65
LDI r7, 105
LDI r8, 104
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 506
LDI r11, 76
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
