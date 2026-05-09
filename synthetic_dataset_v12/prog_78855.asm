; DESCRIPTION: Composite: Creates a purple rectangular region at (118, 47) spanning 35 by 118 pixels then Places a magenta circle of radius 26 at center (266, 220) then Sets a single green pixel at (383, 11).
; PLAN: r0=118(x), r1=47(y), r2=35(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=266(x), r6=220(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=383(x), r11=11(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 118
LDI r1, 47
LDI r2, 35
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 220
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 383
LDI r11, 11
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
