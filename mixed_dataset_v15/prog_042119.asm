; DESCRIPTION: Composite: Places a cyan line segment connecting (260, 223) to (508, 140) then Places a green circle of radius 22 at center (203, 119) then Places a white 26x85 rectangle at position (55, 36).
; PLAN: r0=260(x1), r1=223(y1), r2=508(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=119(y), r7=22(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=55(x), r11=36(y), r12=26(width), r13=85(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 260
LDI r1, 223
LDI r2, 508
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 119
LDI r7, 22
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 55
LDI r11, 36
LDI r12, 26
LDI r13, 85
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
