; DESCRIPTION: Composite: Places a cyan line segment connecting (154, 81) to (427, 8) then Creates a blue rectangular region at (381, 35) spanning 120 by 103 pixels then Creates a blue circular shape at (204, 157) with radius 53.
; PLAN: r0=154(x1), r1=81(y1), r2=427(x2), r3=8(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=35(y), r7=120(width), r8=103(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=204(x), r11=157(y), r12=53(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 154
LDI r1, 81
LDI r2, 427
LDI r3, 8
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 35
LDI r7, 120
LDI r8, 103
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 204
LDI r11, 157
LDI r12, 53
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
