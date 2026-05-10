; DESCRIPTION: Composite: Renders a red disk with center (195, 158) and radius 29 then Places a yellow line segment connecting (233, 251) to (474, 255) then Renders a red box of size 19x71 starting at (133, 62).
; PLAN: r0=195(x), r1=158(y), r2=29(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=233(x1), r6=251(y1), r7=474(x2), r8=255(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=133(x), r11=62(y), r12=19(width), r13=71(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 158
LDI r2, 29
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 233
LDI r6, 251
LDI r7, 474
LDI r8, 255
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 133
LDI r11, 62
LDI r12, 19
LDI r13, 71
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
