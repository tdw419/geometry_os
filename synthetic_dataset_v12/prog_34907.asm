; DESCRIPTION: Composite: Creates a white circular shape at (65, 142) with radius 26 then Places a orange 47x14 rectangle at position (184, 176) then Places a white line segment connecting (343, 254) to (467, 98).
; PLAN: r0=65(x), r1=142(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=184(x), r6=176(y), r7=47(width), r8=14(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x1), r11=254(y1), r12=467(x2), r13=98(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 142
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 184
LDI r6, 176
LDI r7, 47
LDI r8, 14
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 254
LDI r12, 467
LDI r13, 98
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
