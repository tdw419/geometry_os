; DESCRIPTION: Composite: Creates a magenta rectangular region at (201, 87) spanning 59 by 101 pixels then Places a cyan line segment connecting (495, 83) to (225, 73) then Renders a orange disk with center (260, 180) and radius 40.
; PLAN: r0=201(x), r1=87(y), r2=59(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x1), r6=83(y1), r7=225(x2), r8=73(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=260(x), r11=180(y), r12=40(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 201
LDI r1, 87
LDI r2, 59
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 83
LDI r7, 225
LDI r8, 73
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 180
LDI r12, 40
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
