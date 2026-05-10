; DESCRIPTION: Composite: Creates a green circular shape at (149, 178) with radius 20 then Places a blue 75x32 rectangle at position (144, 117) then Places a black line segment connecting (53, 175) to (454, 246).
; PLAN: r0=149(x), r1=178(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=144(x), r6=117(y), r7=75(width), r8=32(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=53(x1), r11=175(y1), r12=454(x2), r13=246(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 149
LDI r1, 178
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 144
LDI r6, 117
LDI r7, 75
LDI r8, 32
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 175
LDI r12, 454
LDI r13, 246
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
