; DESCRIPTION: Composite: Places a red dot at position (325, 118) then Draws a orange circle centered at (293, 123) with radius 40 then Places a white 108x120 rectangle at position (338, 90).
; PLAN: r0=325(x), r1=118(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=293(x), r6=123(y), r7=40(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=338(x), r11=90(y), r12=108(width), r13=120(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 325
LDI r1, 118
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 293
LDI r6, 123
LDI r7, 40
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 338
LDI r11, 90
LDI r12, 108
LDI r13, 120
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
