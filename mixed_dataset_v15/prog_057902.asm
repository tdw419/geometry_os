; DESCRIPTION: Composite: Renders a white box of size 109x70 starting at (103, 158) then Places a blue dot at position (126, 49) then Renders a red disk with center (220, 182) and radius 39.
; PLAN: r0=103(x), r1=158(y), r2=109(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=126(x), r6=49(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=220(x), r11=182(y), r12=39(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 103
LDI r1, 158
LDI r2, 109
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 49
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 220
LDI r11, 182
LDI r12, 39
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
