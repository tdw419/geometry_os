; DESCRIPTION: Composite: Renders a green box of size 29x106 starting at (1, 114) then Places a yellow circle of radius 42 at center (421, 52) then Places a purple dot at position (467, 23).
; PLAN: r0=1(x), r1=114(y), r2=29(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x), r6=52(y), r7=42(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=467(x), r11=23(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 1
LDI r1, 114
LDI r2, 29
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 52
LDI r7, 42
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 467
LDI r11, 23
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
