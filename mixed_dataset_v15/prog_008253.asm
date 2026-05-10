; DESCRIPTION: Composite: Places a red 96x86 rectangle at position (306, 17) then Places a white circle of radius 18 at center (478, 105) then Places a green dot at position (396, 87).
; PLAN: r0=306(x), r1=17(y), r2=96(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x), r6=105(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=87(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 306
LDI r1, 17
LDI r2, 96
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 105
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 87
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
