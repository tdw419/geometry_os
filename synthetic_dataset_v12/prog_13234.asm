; DESCRIPTION: Composite: Places a red 119x61 rectangle at position (111, 144) then Places a purple line segment connecting (116, 70) to (270, 224) then Renders a red disk with center (159, 74) and radius 36.
; PLAN: r0=111(x), r1=144(y), r2=119(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x1), r6=70(y1), r7=270(x2), r8=224(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=159(x), r11=74(y), r12=36(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 111
LDI r1, 144
LDI r2, 119
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 70
LDI r7, 270
LDI r8, 224
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 74
LDI r12, 36
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
