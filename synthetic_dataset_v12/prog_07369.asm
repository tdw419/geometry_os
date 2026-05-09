; DESCRIPTION: Composite: Renders a magenta box of size 13x59 starting at (216, 163) then Creates a red circular shape at (219, 126) with radius 65 then Places a white dot at position (452, 7).
; PLAN: r0=216(x), r1=163(y), r2=13(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x), r6=126(y), r7=65(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=452(x), r11=7(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 216
LDI r1, 163
LDI r2, 13
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 126
LDI r7, 65
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 452
LDI r11, 7
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
