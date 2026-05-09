; DESCRIPTION: Composite: Places a green 18x75 rectangle at position (338, 142) then Renders a blue disk with center (396, 109) and radius 79 then Sets a single blue pixel at (305, 156).
; PLAN: r0=338(x), r1=142(y), r2=18(width), r3=75(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=396(x), r6=109(y), r7=79(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=305(x), r11=156(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 338
LDI r1, 142
LDI r2, 18
LDI r3, 75
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 396
LDI r6, 109
LDI r7, 79
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 305
LDI r11, 156
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
