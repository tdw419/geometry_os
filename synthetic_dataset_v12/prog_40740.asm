; DESCRIPTION: Composite: Places a orange circle of radius 20 at center (240, 53) then Draws a purple rectangle at (392, 151) with width 37 and height 30 then Sets a single yellow pixel at (475, 63).
; PLAN: r0=240(x), r1=53(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=392(x), r6=151(y), r7=37(width), r8=30(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=475(x), r11=63(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 53
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 392
LDI r6, 151
LDI r7, 37
LDI r8, 30
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 475
LDI r11, 63
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
