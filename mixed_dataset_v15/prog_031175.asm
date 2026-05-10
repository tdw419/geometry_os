; DESCRIPTION: Composite: Creates a black circular shape at (146, 117) with radius 40 then Places a magenta line segment connecting (78, 43) to (472, 117) then Places a purple dot at position (267, 39).
; PLAN: r0=146(x), r1=117(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x1), r6=43(y1), r7=472(x2), r8=117(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=267(x), r11=39(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 146
LDI r1, 117
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 43
LDI r7, 472
LDI r8, 117
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 39
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
