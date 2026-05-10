; DESCRIPTION: Composite: Renders a red line between points (159, 77) and (139, 120) then Places a orange 14x15 rectangle at position (466, 9) then Draws a cyan circle centered at (273, 62) with radius 48.
; PLAN: r0=159(x1), r1=77(y1), r2=139(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=9(y), r7=14(width), r8=15(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=273(x), r11=62(y), r12=48(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 159
LDI r1, 77
LDI r2, 139
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 9
LDI r7, 14
LDI r8, 15
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 62
LDI r12, 48
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
