; DESCRIPTION: Composite: Draws a black rectangle at (454, 125) with width 58 and height 111 then Renders a blue disk with center (318, 139) and radius 63 then Sets a single green pixel at (236, 149).
; PLAN: r0=454(x), r1=125(y), r2=58(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=318(x), r6=139(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=236(x), r11=149(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 454
LDI r1, 125
LDI r2, 58
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 139
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 236
LDI r11, 149
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
