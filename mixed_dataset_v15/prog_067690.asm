; DESCRIPTION: Composite: Places a white line segment connecting (291, 2) to (62, 16) then Renders a white box of size 46x97 starting at (95, 66) then Renders a magenta disk with center (58, 39) and radius 31.
; PLAN: r0=291(x1), r1=2(y1), r2=62(x2), r3=16(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=66(y), r7=46(width), r8=97(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=58(x), r11=39(y), r12=31(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 291
LDI r1, 2
LDI r2, 62
LDI r3, 16
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 66
LDI r7, 46
LDI r8, 97
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 58
LDI r11, 39
LDI r12, 31
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
