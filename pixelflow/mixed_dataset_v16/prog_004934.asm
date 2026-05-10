; DESCRIPTION: Composite: Renders a orange line between points (102, 80) and (442, 27) then Places a orange 94x106 rectangle at position (149, 48) then Places a yellow circle of radius 69 at center (320, 148).
; PLAN: r0=102(x1), r1=80(y1), r2=442(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=48(y), r7=94(width), r8=106(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=320(x), r11=148(y), r12=69(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 102
LDI r1, 80
LDI r2, 442
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 48
LDI r7, 94
LDI r8, 106
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 148
LDI r12, 69
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
