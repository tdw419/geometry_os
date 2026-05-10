; DESCRIPTION: Composite: Renders a purple line between points (241, 213) and (407, 191) then Draws a blue circle centered at (148, 122) with radius 41 then Places a cyan 77x112 rectangle at position (5, 72).
; PLAN: r0=241(x1), r1=213(y1), r2=407(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=122(y), r7=41(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=5(x), r11=72(y), r12=77(width), r13=112(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 213
LDI r2, 407
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 122
LDI r7, 41
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 5
LDI r11, 72
LDI r12, 77
LDI r13, 112
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
