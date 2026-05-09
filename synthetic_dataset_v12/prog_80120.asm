; DESCRIPTION: Composite: Places a green 106x60 rectangle at position (96, 54) then Draws a purple circle centered at (379, 75) with radius 69 then Places a orange dot at position (459, 220).
; PLAN: r0=96(x), r1=54(y), r2=106(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x), r6=75(y), r7=69(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=459(x), r11=220(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 54
LDI r2, 106
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 75
LDI r7, 69
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 459
LDI r11, 220
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
