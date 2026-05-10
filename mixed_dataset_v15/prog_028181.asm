; DESCRIPTION: Composite: Creates a purple rectangular region at (345, 102) spanning 78 by 82 pixels then Renders a green disk with center (199, 189) and radius 45 then Sets a single purple pixel at (68, 8).
; PLAN: r0=345(x), r1=102(y), r2=78(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=199(x), r6=189(y), r7=45(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x), r11=8(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 345
LDI r1, 102
LDI r2, 78
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 189
LDI r7, 45
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 8
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
