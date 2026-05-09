; DESCRIPTION: Composite: Sets a single purple pixel at (36, 85) then Draws a yellow rectangle at (315, 210) with width 56 and height 35 then Draws a yellow circle centered at (390, 157) with radius 80.
; PLAN: r0=36(x), r1=85(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=315(x), r6=210(y), r7=56(width), r8=35(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=390(x), r11=157(y), r12=80(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 36
LDI r1, 85
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 315
LDI r6, 210
LDI r7, 56
LDI r8, 35
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 390
LDI r11, 157
LDI r12, 80
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
