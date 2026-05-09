; DESCRIPTION: Composite: Renders a yellow box of size 42x105 starting at (29, 108) then Places a yellow circle of radius 30 at center (331, 122) then Sets a single black pixel at (79, 238).
; PLAN: r0=29(x), r1=108(y), r2=42(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=331(x), r6=122(y), r7=30(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x), r11=238(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 29
LDI r1, 108
LDI r2, 42
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 122
LDI r7, 30
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 238
LDI r12, 0x000000
PSET r10, r11, r12
HALT
