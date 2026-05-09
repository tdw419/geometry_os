; DESCRIPTION: Composite: Renders a blue box of size 39x17 starting at (425, 149) then Creates a white circular shape at (87, 101) with radius 77 then Sets a single magenta pixel at (377, 93).
; PLAN: r0=425(x), r1=149(y), r2=39(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x), r6=101(y), r7=77(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=377(x), r11=93(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 425
LDI r1, 149
LDI r2, 39
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 101
LDI r7, 77
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 377
LDI r11, 93
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
