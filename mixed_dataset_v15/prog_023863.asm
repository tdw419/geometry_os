; DESCRIPTION: Composite: Renders a white box of size 80x23 starting at (212, 194) then Places a purple circle of radius 65 at center (139, 107) then Places a red dot at position (54, 1).
; PLAN: r0=212(x), r1=194(y), r2=80(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=139(x), r6=107(y), r7=65(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=54(x), r11=1(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 212
LDI r1, 194
LDI r2, 80
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 107
LDI r7, 65
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 54
LDI r11, 1
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
