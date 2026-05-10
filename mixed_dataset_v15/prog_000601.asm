; DESCRIPTION: Composite: Renders a purple disk with center (367, 56) and radius 42 then Sets a single black pixel at (461, 122) then Draws a green rectangle at (407, 113) with width 86 and height 53.
; PLAN: r0=367(x), r1=56(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=461(x), r6=122(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=407(x), r11=113(y), r12=86(width), r13=53(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 56
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 461
LDI r6, 122
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 407
LDI r11, 113
LDI r12, 86
LDI r13, 53
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
