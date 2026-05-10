; DESCRIPTION: Composite: Draws a green circle centered at (457, 94) with radius 51 then Places a yellow line segment connecting (130, 205) to (274, 66) then Sets a single black pixel at (455, 186).
; PLAN: r0=457(x), r1=94(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=130(x1), r6=205(y1), r7=274(x2), r8=66(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=455(x), r11=186(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 457
LDI r1, 94
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 130
LDI r6, 205
LDI r7, 274
LDI r8, 66
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 186
LDI r12, 0x000000
PSET r10, r11, r12
HALT
