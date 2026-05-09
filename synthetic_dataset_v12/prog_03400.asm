; DESCRIPTION: Composite: Renders a purple box of size 67x119 starting at (39, 73) then Places a orange dot at position (418, 248) then Places a purple circle of radius 22 at center (42, 137).
; PLAN: r0=39(x), r1=73(y), r2=67(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=248(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=42(x), r11=137(y), r12=22(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 39
LDI r1, 73
LDI r2, 67
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 248
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 42
LDI r11, 137
LDI r12, 22
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
