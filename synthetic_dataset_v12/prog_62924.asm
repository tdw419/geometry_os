; DESCRIPTION: Composite: Draws a black line from (259, 27) to (506, 42) then Creates a green circular shape at (49, 231) with radius 21 then Renders a orange box of size 51x15 starting at (95, 66).
; PLAN: r0=259(x1), r1=27(y1), r2=506(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=231(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=95(x), r11=66(y), r12=51(width), r13=15(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 259
LDI r1, 27
LDI r2, 506
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 231
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 95
LDI r11, 66
LDI r12, 51
LDI r13, 15
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
