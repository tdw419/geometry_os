; DESCRIPTION: Composite: Renders a orange box of size 49x56 starting at (180, 185) then Places a black line segment connecting (7, 42) to (222, 168) then Renders a red disk with center (152, 172) and radius 76.
; PLAN: r0=180(x), r1=185(y), r2=49(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=7(x1), r6=42(y1), r7=222(x2), r8=168(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=152(x), r11=172(y), r12=76(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 180
LDI r1, 185
LDI r2, 49
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 42
LDI r7, 222
LDI r8, 168
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 172
LDI r12, 76
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
