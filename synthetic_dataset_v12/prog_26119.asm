; DESCRIPTION: Composite: Places a magenta circle of radius 12 at center (93, 84) then Sets a single cyan pixel at (248, 48) then Draws a green rectangle at (267, 94) with width 86 and height 93.
; PLAN: r0=93(x), r1=84(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=48(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=267(x), r11=94(y), r12=86(width), r13=93(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 84
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 48
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 267
LDI r11, 94
LDI r12, 86
LDI r13, 93
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
