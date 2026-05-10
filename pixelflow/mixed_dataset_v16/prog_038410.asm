; DESCRIPTION: Composite: Draws a red circle centered at (257, 164) with radius 23 then Renders a orange line between points (360, 83) and (450, 101) then Draws a black rectangle at (434, 75) with width 59 and height 35.
; PLAN: r0=257(x), r1=164(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x1), r6=83(y1), r7=450(x2), r8=101(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=434(x), r11=75(y), r12=59(width), r13=35(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 164
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 83
LDI r7, 450
LDI r8, 101
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 434
LDI r11, 75
LDI r12, 59
LDI r13, 35
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
