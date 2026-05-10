; DESCRIPTION: Composite: Creates a cyan circular shape at (348, 58) with radius 15 then Places a yellow line segment connecting (135, 69) to (489, 203) then Places a orange dot at position (21, 122).
; PLAN: r0=348(x), r1=58(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=135(x1), r6=69(y1), r7=489(x2), r8=203(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=21(x), r11=122(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 348
LDI r1, 58
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 135
LDI r6, 69
LDI r7, 489
LDI r8, 203
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 21
LDI r11, 122
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
