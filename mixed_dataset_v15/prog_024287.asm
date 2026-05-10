; DESCRIPTION: Composite: Sets a single black pixel at (415, 227) then Places a purple circle of radius 15 at center (324, 229) then Creates a purple rectangular region at (125, 42) spanning 10 by 106 pixels.
; PLAN: r0=415(x), r1=227(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=324(x), r6=229(y), r7=15(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=125(x), r11=42(y), r12=10(width), r13=106(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 227
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 324
LDI r6, 229
LDI r7, 15
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 125
LDI r11, 42
LDI r12, 10
LDI r13, 106
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
