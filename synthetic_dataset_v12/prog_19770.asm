; DESCRIPTION: Composite: Draws a white rectangle at (211, 116) with width 30 and height 52 then Places a magenta line segment connecting (339, 87) to (397, 179) then Renders a yellow disk with center (153, 197) and radius 55.
; PLAN: r0=211(x), r1=116(y), r2=30(width), r3=52(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x1), r6=87(y1), r7=397(x2), r8=179(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=153(x), r11=197(y), r12=55(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 211
LDI r1, 116
LDI r2, 30
LDI r3, 52
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 87
LDI r7, 397
LDI r8, 179
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 153
LDI r11, 197
LDI r12, 55
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
