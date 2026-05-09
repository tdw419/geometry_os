; DESCRIPTION: Composite: Places a purple 26x106 rectangle at position (407, 145) then Places a blue dot at position (226, 9) then Places a purple circle of radius 27 at center (438, 215).
; PLAN: r0=407(x), r1=145(y), r2=26(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=226(x), r6=9(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=438(x), r11=215(y), r12=27(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 407
LDI r1, 145
LDI r2, 26
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 9
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 438
LDI r11, 215
LDI r12, 27
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
