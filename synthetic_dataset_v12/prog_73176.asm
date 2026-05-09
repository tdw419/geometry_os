; DESCRIPTION: Composite: Draws a black circle centered at (469, 216) with radius 24 then Renders a magenta line between points (315, 238) and (35, 123) then Places a magenta dot at position (415, 110).
; PLAN: r0=469(x), r1=216(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x1), r6=238(y1), r7=35(x2), r8=123(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=415(x), r11=110(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 469
LDI r1, 216
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 238
LDI r7, 35
LDI r8, 123
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 415
LDI r11, 110
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
