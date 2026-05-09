; DESCRIPTION: Composite: Renders a white box of size 109x34 starting at (205, 207) then Places a blue line segment connecting (133, 253) to (470, 187) then Creates a orange circular shape at (434, 129) with radius 73.
; PLAN: r0=205(x), r1=207(y), r2=109(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=133(x1), r6=253(y1), r7=470(x2), r8=187(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=434(x), r11=129(y), r12=73(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 205
LDI r1, 207
LDI r2, 109
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 253
LDI r7, 470
LDI r8, 187
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 129
LDI r12, 73
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
