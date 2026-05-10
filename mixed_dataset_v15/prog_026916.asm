; DESCRIPTION: Composite: Places a orange dot at position (462, 233) then Places a orange line segment connecting (109, 45) to (322, 228) then Draws a red rectangle at (270, 123) with width 78 and height 29.
; PLAN: r0=462(x), r1=233(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=109(x1), r6=45(y1), r7=322(x2), r8=228(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=270(x), r11=123(y), r12=78(width), r13=29(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 462
LDI r1, 233
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 109
LDI r6, 45
LDI r7, 322
LDI r8, 228
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 270
LDI r11, 123
LDI r12, 78
LDI r13, 29
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
