; DESCRIPTION: Composite: Places a yellow circle of radius 21 at center (116, 103) then Places a orange dot at position (55, 226) then Places a black 15x91 rectangle at position (482, 133).
; PLAN: r0=116(x), r1=103(y), r2=21(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=226(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=482(x), r11=133(y), r12=15(width), r13=91(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 116
LDI r1, 103
LDI r2, 21
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 226
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 482
LDI r11, 133
LDI r12, 15
LDI r13, 91
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
