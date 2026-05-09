; DESCRIPTION: Composite: Renders a purple box of size 100x65 starting at (389, 118) then Draws a green circle centered at (170, 87) with radius 61 then Places a green dot at position (296, 85).
; PLAN: r0=389(x), r1=118(y), r2=100(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x), r6=87(y), r7=61(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=296(x), r11=85(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 389
LDI r1, 118
LDI r2, 100
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 87
LDI r7, 61
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 296
LDI r11, 85
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
