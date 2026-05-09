; DESCRIPTION: Composite: Renders a green box of size 116x112 starting at (203, 123) then Renders a black line between points (173, 103) and (296, 163) then Places a cyan circle of radius 45 at center (87, 191).
; PLAN: r0=203(x), r1=123(y), r2=116(width), r3=112(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=173(x1), r6=103(y1), r7=296(x2), r8=163(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=87(x), r11=191(y), r12=45(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 203
LDI r1, 123
LDI r2, 116
LDI r3, 112
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 173
LDI r6, 103
LDI r7, 296
LDI r8, 163
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 87
LDI r11, 191
LDI r12, 45
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
