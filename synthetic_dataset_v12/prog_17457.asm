; DESCRIPTION: Composite: Renders a purple disk with center (426, 88) and radius 53 then Creates a blue rectangular region at (361, 89) spanning 50 by 44 pixels then Places a yellow dot at position (31, 28).
; PLAN: r0=426(x), r1=88(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=361(x), r6=89(y), r7=50(width), r8=44(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=31(x), r11=28(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 88
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 361
LDI r6, 89
LDI r7, 50
LDI r8, 44
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 28
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
