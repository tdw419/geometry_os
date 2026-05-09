; DESCRIPTION: Composite: Places a black circle of radius 28 at center (172, 91) then Creates a blue rectangular region at (111, 39) spanning 93 by 55 pixels then Places a blue dot at position (288, 142).
; PLAN: r0=172(x), r1=91(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=39(y), r7=93(width), r8=55(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=288(x), r11=142(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 172
LDI r1, 91
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 39
LDI r7, 93
LDI r8, 55
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 142
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
