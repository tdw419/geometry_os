; DESCRIPTION: Composite: Places a red 20x37 rectangle at position (255, 197) then Sets a single green pixel at (217, 39) then Draws a magenta circle centered at (235, 92) with radius 33.
; PLAN: r0=255(x), r1=197(y), r2=20(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=39(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=235(x), r11=92(y), r12=33(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 255
LDI r1, 197
LDI r2, 20
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 39
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 235
LDI r11, 92
LDI r12, 33
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
