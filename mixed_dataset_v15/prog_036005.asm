; DESCRIPTION: Composite: Draws a red circle centered at (257, 99) with radius 77 then Places a purple line segment connecting (298, 119) to (226, 194) then Places a orange 24x72 rectangle at position (348, 115).
; PLAN: r0=257(x), r1=99(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x1), r6=119(y1), r7=226(x2), r8=194(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=348(x), r11=115(y), r12=24(width), r13=72(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 257
LDI r1, 99
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 119
LDI r7, 226
LDI r8, 194
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 115
LDI r12, 24
LDI r13, 72
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
