; DESCRIPTION: Composite: Creates a purple circular shape at (331, 176) with radius 33 then Draws a purple rectangle at (284, 217) with width 56 and height 35 then Places a magenta dot at position (181, 48).
; PLAN: r0=331(x), r1=176(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=217(y), r7=56(width), r8=35(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=181(x), r11=48(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 331
LDI r1, 176
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 217
LDI r7, 56
LDI r8, 35
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 181
LDI r11, 48
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
