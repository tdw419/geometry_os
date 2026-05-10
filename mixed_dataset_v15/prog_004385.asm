; DESCRIPTION: Composite: Places a black line segment connecting (164, 244) to (94, 235) then Draws a yellow rectangle at (14, 165) with width 59 and height 62 then Sets a single purple pixel at (497, 126).
; PLAN: r0=164(x1), r1=244(y1), r2=94(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=14(x), r6=165(y), r7=59(width), r8=62(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x), r11=126(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 244
LDI r2, 94
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 14
LDI r6, 165
LDI r7, 59
LDI r8, 62
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 126
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
