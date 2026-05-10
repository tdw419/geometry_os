; DESCRIPTION: Composite: Creates a green circular shape at (266, 221) with radius 31 then Places a black 46x49 rectangle at position (466, 189) then Places a black line segment connecting (34, 65) to (259, 69).
; PLAN: r0=266(x), r1=221(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x), r6=189(y), r7=46(width), r8=49(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=34(x1), r11=65(y1), r12=259(x2), r13=69(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 266
LDI r1, 221
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 189
LDI r7, 46
LDI r8, 49
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 65
LDI r12, 259
LDI r13, 69
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
