; DESCRIPTION: Composite: Creates a orange rectangular region at (338, 8) spanning 74 by 66 pixels then Places a yellow circle of radius 45 at center (120, 179) then Sets a single orange pixel at (371, 130).
; PLAN: r0=338(x), r1=8(y), r2=74(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=179(y), r7=45(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=371(x), r11=130(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 338
LDI r1, 8
LDI r2, 74
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 179
LDI r7, 45
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 371
LDI r11, 130
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
