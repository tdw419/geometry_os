; DESCRIPTION: Composite: Places a black line segment connecting (13, 153) to (271, 222) then Sets a single black pixel at (57, 43) then Places a orange 50x73 rectangle at position (329, 183).
; PLAN: r0=13(x1), r1=153(y1), r2=271(x2), r3=222(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=57(x), r6=43(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=329(x), r11=183(y), r12=50(width), r13=73(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 153
LDI r2, 271
LDI r3, 222
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 43
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 329
LDI r11, 183
LDI r12, 50
LDI r13, 73
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
