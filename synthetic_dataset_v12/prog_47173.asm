; DESCRIPTION: Composite: Places a yellow 88x79 rectangle at position (184, 4) then Draws a cyan circle centered at (313, 24) with radius 15 then Sets a single blue pixel at (197, 65).
; PLAN: r0=184(x), r1=4(y), r2=88(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x), r6=24(y), r7=15(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=197(x), r11=65(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 4
LDI r2, 88
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 24
LDI r7, 15
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 197
LDI r11, 65
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
