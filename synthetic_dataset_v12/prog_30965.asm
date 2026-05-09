; DESCRIPTION: Composite: Places a purple circle of radius 22 at center (469, 85) then Creates a cyan rectangular region at (112, 66) spanning 99 by 107 pixels then Places a magenta dot at position (62, 165).
; PLAN: r0=469(x), r1=85(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=112(x), r6=66(y), r7=99(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=62(x), r11=165(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 469
LDI r1, 85
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 112
LDI r6, 66
LDI r7, 99
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 165
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
