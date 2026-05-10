; DESCRIPTION: Composite: Creates a cyan circular shape at (191, 134) with radius 28 then Sets a single purple pixel at (268, 87) then Creates a purple rectangular region at (119, 51) spanning 98 by 21 pixels.
; PLAN: r0=191(x), r1=134(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=87(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=119(x), r11=51(y), r12=98(width), r13=21(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 191
LDI r1, 134
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 87
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 119
LDI r11, 51
LDI r12, 98
LDI r13, 21
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
