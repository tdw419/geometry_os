; DESCRIPTION: Composite: Draws a white circle centered at (41, 137) with radius 25 then Places a purple dot at position (420, 120) then Places a red 101x84 rectangle at position (338, 172).
; PLAN: r0=41(x), r1=137(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=420(x), r6=120(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=338(x), r11=172(y), r12=101(width), r13=84(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 41
LDI r1, 137
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 420
LDI r6, 120
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 338
LDI r11, 172
LDI r12, 101
LDI r13, 84
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
