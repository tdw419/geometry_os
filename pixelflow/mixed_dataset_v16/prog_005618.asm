; DESCRIPTION: Composite: Creates a blue rectangular region at (30, 12) spanning 104 by 24 pixels then Creates a cyan circular shape at (454, 149) with radius 55 then Sets a single blue pixel at (37, 118).
; PLAN: r0=30(x), r1=12(y), r2=104(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x), r6=149(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=37(x), r11=118(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 30
LDI r1, 12
LDI r2, 104
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 149
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 37
LDI r11, 118
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
