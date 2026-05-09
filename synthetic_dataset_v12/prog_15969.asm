; DESCRIPTION: Composite: Renders a purple line between points (165, 104) and (253, 219) then Places a cyan 47x106 rectangle at position (125, 69) then Creates a green circular shape at (351, 77) with radius 66.
; PLAN: r0=165(x1), r1=104(y1), r2=253(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=69(y), r7=47(width), r8=106(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=351(x), r11=77(y), r12=66(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 165
LDI r1, 104
LDI r2, 253
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 69
LDI r7, 47
LDI r8, 106
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 77
LDI r12, 66
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
