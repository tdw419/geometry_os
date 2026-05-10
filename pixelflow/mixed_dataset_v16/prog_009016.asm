; DESCRIPTION: Composite: Creates a blue rectangular region at (40, 4) spanning 118 by 116 pixels then Places a cyan circle of radius 35 at center (461, 119) then Sets a single blue pixel at (327, 93).
; PLAN: r0=40(x), r1=4(y), r2=118(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x), r6=119(y), r7=35(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=327(x), r11=93(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 40
LDI r1, 4
LDI r2, 118
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 119
LDI r7, 35
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 327
LDI r11, 93
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
