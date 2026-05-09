; DESCRIPTION: Composite: Places a cyan 97x55 rectangle at position (132, 10) then Places a magenta line segment connecting (277, 200) to (462, 254) then Creates a white circular shape at (216, 165) with radius 27.
; PLAN: r0=132(x), r1=10(y), r2=97(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x1), r6=200(y1), r7=462(x2), r8=254(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=165(y), r12=27(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 132
LDI r1, 10
LDI r2, 97
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 200
LDI r7, 462
LDI r8, 254
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 165
LDI r12, 27
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
