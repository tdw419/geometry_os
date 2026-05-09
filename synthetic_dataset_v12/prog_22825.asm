; DESCRIPTION: Composite: Creates a white circular shape at (360, 215) with radius 29 then Draws a orange rectangle at (449, 43) with width 12 and height 48 then Renders a white line between points (394, 6) and (471, 98).
; PLAN: r0=360(x), r1=215(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=449(x), r6=43(y), r7=12(width), r8=48(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=394(x1), r11=6(y1), r12=471(x2), r13=98(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 215
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 449
LDI r6, 43
LDI r7, 12
LDI r8, 48
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 6
LDI r12, 471
LDI r13, 98
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
