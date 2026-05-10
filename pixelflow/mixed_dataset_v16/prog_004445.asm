; DESCRIPTION: Composite: Places a yellow circle of radius 43 at center (469, 195) then Sets a single purple pixel at (443, 157) then Places a blue 16x30 rectangle at position (485, 84).
; PLAN: r0=469(x), r1=195(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=443(x), r6=157(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=485(x), r11=84(y), r12=16(width), r13=30(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 469
LDI r1, 195
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 443
LDI r6, 157
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 485
LDI r11, 84
LDI r12, 16
LDI r13, 30
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
