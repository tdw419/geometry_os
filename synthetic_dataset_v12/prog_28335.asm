; DESCRIPTION: Composite: Renders a red box of size 11x103 starting at (284, 82) then Draws a yellow line from (435, 22) to (187, 97) then Creates a yellow circular shape at (253, 65) with radius 26.
; PLAN: r0=284(x), r1=82(y), r2=11(width), r3=103(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=435(x1), r6=22(y1), r7=187(x2), r8=97(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=253(x), r11=65(y), r12=26(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 284
LDI r1, 82
LDI r2, 11
LDI r3, 103
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 22
LDI r7, 187
LDI r8, 97
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 253
LDI r11, 65
LDI r12, 26
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
