; DESCRIPTION: Composite: Creates a blue rectangular region at (3, 75) spanning 73 by 45 pixels then Places a black line segment connecting (257, 244) to (323, 213) then Renders a red disk with center (269, 133) and radius 75.
; PLAN: r0=3(x), r1=75(y), r2=73(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x1), r6=244(y1), r7=323(x2), r8=213(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=269(x), r11=133(y), r12=75(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 3
LDI r1, 75
LDI r2, 73
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 244
LDI r7, 323
LDI r8, 213
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 133
LDI r12, 75
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
