; DESCRIPTION: Composite: Places a blue line segment connecting (55, 116) to (270, 32) then Places a cyan 116x68 rectangle at position (263, 109) then Creates a purple circular shape at (149, 194) with radius 10.
; PLAN: r0=55(x1), r1=116(y1), r2=270(x2), r3=32(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=109(y), r7=116(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=149(x), r11=194(y), r12=10(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 55
LDI r1, 116
LDI r2, 270
LDI r3, 32
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 109
LDI r7, 116
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 194
LDI r12, 10
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
