; DESCRIPTION: Composite: Creates a orange circular shape at (434, 154) with radius 65 then Places a white line segment connecting (423, 255) to (76, 37) then Creates a yellow rectangular region at (275, 29) spanning 85 by 18 pixels.
; PLAN: r0=434(x), r1=154(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=423(x1), r6=255(y1), r7=76(x2), r8=37(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=275(x), r11=29(y), r12=85(width), r13=18(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 434
LDI r1, 154
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 423
LDI r6, 255
LDI r7, 76
LDI r8, 37
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 275
LDI r11, 29
LDI r12, 85
LDI r13, 18
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
