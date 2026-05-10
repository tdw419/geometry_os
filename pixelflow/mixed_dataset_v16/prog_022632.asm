; DESCRIPTION: Composite: Places a red 107x44 rectangle at position (348, 109) then Draws a orange circle centered at (386, 104) with radius 27 then Renders a orange line between points (319, 137) and (223, 196).
; PLAN: r0=348(x), r1=109(y), r2=107(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x), r6=104(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=319(x1), r11=137(y1), r12=223(x2), r13=196(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 109
LDI r2, 107
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 104
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 319
LDI r11, 137
LDI r12, 223
LDI r13, 196
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
