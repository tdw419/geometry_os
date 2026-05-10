; DESCRIPTION: Composite: Creates a yellow rectangular region at (84, 123) spanning 93 by 30 pixels then Places a blue dot at position (358, 23) then Places a blue circle of radius 48 at center (326, 125).
; PLAN: r0=84(x), r1=123(y), r2=93(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=358(x), r6=23(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=326(x), r11=125(y), r12=48(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 84
LDI r1, 123
LDI r2, 93
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 23
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 326
LDI r11, 125
LDI r12, 48
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
