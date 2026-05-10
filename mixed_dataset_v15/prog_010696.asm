; DESCRIPTION: Composite: Draws a blue circle centered at (124, 110) with radius 58 then Draws a orange rectangle at (389, 93) with width 84 and height 102 then Places a cyan dot at position (137, 117).
; PLAN: r0=124(x), r1=110(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x), r6=93(y), r7=84(width), r8=102(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=137(x), r11=117(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 124
LDI r1, 110
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 93
LDI r7, 84
LDI r8, 102
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 137
LDI r11, 117
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
