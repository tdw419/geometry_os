; DESCRIPTION: Composite: Creates a black circular shape at (335, 77) with radius 70 then Places a white 46x14 rectangle at position (338, 124) then Renders a white line between points (154, 76) and (260, 188).
; PLAN: r0=335(x), r1=77(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x), r6=124(y), r7=46(width), r8=14(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x1), r11=76(y1), r12=260(x2), r13=188(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 335
LDI r1, 77
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 124
LDI r7, 46
LDI r8, 14
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 76
LDI r12, 260
LDI r13, 188
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
