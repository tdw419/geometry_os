; DESCRIPTION: Composite: Places a orange line segment connecting (271, 41) to (339, 54) then Places a red 115x75 rectangle at position (348, 23) then Renders a black disk with center (32, 91) and radius 24.
; PLAN: r0=271(x1), r1=41(y1), r2=339(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=23(y), r7=115(width), r8=75(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=32(x), r11=91(y), r12=24(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 271
LDI r1, 41
LDI r2, 339
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 23
LDI r7, 115
LDI r8, 75
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 91
LDI r12, 24
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
