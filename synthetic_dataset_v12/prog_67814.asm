; DESCRIPTION: Composite: Places a cyan line segment connecting (166, 129) to (454, 33) then Places a yellow 43x80 rectangle at position (466, 29) then Creates a purple circular shape at (294, 133) with radius 66.
; PLAN: r0=166(x1), r1=129(y1), r2=454(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=29(y), r7=43(width), r8=80(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=294(x), r11=133(y), r12=66(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 166
LDI r1, 129
LDI r2, 454
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 29
LDI r7, 43
LDI r8, 80
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 294
LDI r11, 133
LDI r12, 66
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
