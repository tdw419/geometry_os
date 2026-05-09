; DESCRIPTION: Composite: Draws a magenta circle centered at (146, 78) with radius 46 then Places a purple line segment connecting (455, 195) to (501, 16) then Places a green dot at position (370, 5).
; PLAN: r0=146(x), r1=78(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=455(x1), r6=195(y1), r7=501(x2), r8=16(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=370(x), r11=5(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 78
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 455
LDI r6, 195
LDI r7, 501
LDI r8, 16
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 5
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
