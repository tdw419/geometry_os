; DESCRIPTION: Composite: Places a purple line segment connecting (155, 96) to (327, 21) then Draws a white circle centered at (327, 139) with radius 49 then Places a green dot at position (248, 200).
; PLAN: r0=155(x1), r1=96(y1), r2=327(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=139(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=248(x), r11=200(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 96
LDI r2, 327
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 139
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 248
LDI r11, 200
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
