; DESCRIPTION: Composite: Draws a blue circle centered at (85, 137) with radius 64 then Draws a black line from (99, 15) to (47, 254) then Renders a red box of size 58x39 starting at (405, 167).
; PLAN: r0=85(x), r1=137(y), r2=64(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=99(x1), r6=15(y1), r7=47(x2), r8=254(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=405(x), r11=167(y), r12=58(width), r13=39(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 137
LDI r2, 64
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 99
LDI r6, 15
LDI r7, 47
LDI r8, 254
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 167
LDI r12, 58
LDI r13, 39
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
