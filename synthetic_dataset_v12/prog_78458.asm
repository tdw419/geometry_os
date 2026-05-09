; DESCRIPTION: Composite: Places a blue 95x73 rectangle at position (140, 114) then Creates a white circular shape at (190, 106) with radius 54 then Places a purple dot at position (20, 244).
; PLAN: r0=140(x), r1=114(y), r2=95(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=106(y), r7=54(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=20(x), r11=244(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 140
LDI r1, 114
LDI r2, 95
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 106
LDI r7, 54
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 20
LDI r11, 244
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
