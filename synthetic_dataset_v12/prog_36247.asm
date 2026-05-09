; DESCRIPTION: Composite: Places a yellow line segment connecting (450, 4) to (149, 111) then Places a orange circle of radius 26 at center (379, 134) then Renders a orange box of size 90x20 starting at (179, 83).
; PLAN: r0=450(x1), r1=4(y1), r2=149(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=379(x), r6=134(y), r7=26(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=179(x), r11=83(y), r12=90(width), r13=20(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 450
LDI r1, 4
LDI r2, 149
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 134
LDI r7, 26
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 179
LDI r11, 83
LDI r12, 90
LDI r13, 20
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
