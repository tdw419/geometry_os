; DESCRIPTION: Composite: Places a green 15x115 rectangle at position (445, 13) then Places a purple circle of radius 17 at center (141, 86) then Sets a single green pixel at (306, 18).
; PLAN: r0=445(x), r1=13(y), r2=15(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=86(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=306(x), r11=18(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 445
LDI r1, 13
LDI r2, 15
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 86
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 306
LDI r11, 18
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
