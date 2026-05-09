; DESCRIPTION: Composite: Creates a green rectangular region at (311, 79) spanning 74 by 118 pixels then Places a red circle of radius 61 at center (154, 99) then Sets a single purple pixel at (172, 101).
; PLAN: r0=311(x), r1=79(y), r2=74(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=99(y), r7=61(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=172(x), r11=101(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 311
LDI r1, 79
LDI r2, 74
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 99
LDI r7, 61
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 172
LDI r11, 101
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
