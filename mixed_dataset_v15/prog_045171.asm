; DESCRIPTION: Composite: Draws a cyan rectangle at (45, 52) with width 93 and height 96 then Renders a purple disk with center (30, 224) and radius 23 then Places a orange dot at position (77, 177).
; PLAN: r0=45(x), r1=52(y), r2=93(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=30(x), r6=224(y), r7=23(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=77(x), r11=177(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 45
LDI r1, 52
LDI r2, 93
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 224
LDI r7, 23
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 77
LDI r11, 177
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
