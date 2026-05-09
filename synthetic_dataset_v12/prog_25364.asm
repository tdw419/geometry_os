; DESCRIPTION: Composite: Places a orange line segment connecting (261, 235) to (193, 230) then Draws a blue circle centered at (368, 70) with radius 39 then Sets a single black pixel at (24, 173).
; PLAN: r0=261(x1), r1=235(y1), r2=193(x2), r3=230(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=70(y), r7=39(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x), r11=173(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 261
LDI r1, 235
LDI r2, 193
LDI r3, 230
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 70
LDI r7, 39
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 173
LDI r12, 0x000000
PSET r10, r11, r12
HALT
