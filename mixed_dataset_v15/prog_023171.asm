; DESCRIPTION: Composite: Places a red line segment connecting (360, 114) to (293, 228) then Places a white 54x33 rectangle at position (261, 10) then Draws a orange circle centered at (384, 105) with radius 47.
; PLAN: r0=360(x1), r1=114(y1), r2=293(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=10(y), r7=54(width), r8=33(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=384(x), r11=105(y), r12=47(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 360
LDI r1, 114
LDI r2, 293
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 10
LDI r7, 54
LDI r8, 33
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 105
LDI r12, 47
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
