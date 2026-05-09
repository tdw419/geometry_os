; DESCRIPTION: Composite: Creates a red circular shape at (409, 112) with radius 13 then Places a orange dot at position (383, 126) then Draws a purple rectangle at (51, 192) with width 95 and height 58.
; PLAN: r0=409(x), r1=112(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=126(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=51(x), r11=192(y), r12=95(width), r13=58(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 112
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 126
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 51
LDI r11, 192
LDI r12, 95
LDI r13, 58
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
