; DESCRIPTION: Composite: Creates a yellow rectangular region at (286, 216) spanning 17 by 40 pixels then Places a blue circle of radius 34 at center (106, 95) then Places a red dot at position (297, 53).
; PLAN: r0=286(x), r1=216(y), r2=17(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=95(y), r7=34(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=297(x), r11=53(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 286
LDI r1, 216
LDI r2, 17
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 95
LDI r7, 34
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 297
LDI r11, 53
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
