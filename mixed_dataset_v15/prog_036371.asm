; DESCRIPTION: Composite: Renders a cyan box of size 86x48 starting at (241, 11) then Sets a single magenta pixel at (431, 151) then Renders a purple disk with center (396, 97) and radius 15.
; PLAN: r0=241(x), r1=11(y), r2=86(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x), r6=151(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=396(x), r11=97(y), r12=15(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 241
LDI r1, 11
LDI r2, 86
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 151
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 396
LDI r11, 97
LDI r12, 15
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
