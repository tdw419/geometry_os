; DESCRIPTION: Composite: Draws a red rectangle at (158, 228) with width 104 and height 20 then Renders a red disk with center (100, 126) and radius 69 then Places a purple dot at position (75, 218).
; PLAN: r0=158(x), r1=228(y), r2=104(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=100(x), r6=126(y), r7=69(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=75(x), r11=218(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 158
LDI r1, 228
LDI r2, 104
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 100
LDI r6, 126
LDI r7, 69
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 75
LDI r11, 218
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
