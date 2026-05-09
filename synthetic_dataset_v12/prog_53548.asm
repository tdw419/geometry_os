; DESCRIPTION: Composite: Places a black circle of radius 53 at center (155, 147) then Draws a yellow line from (314, 32) to (271, 183) then Places a green dot at position (268, 205).
; PLAN: r0=155(x), r1=147(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x1), r6=32(y1), r7=271(x2), r8=183(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=268(x), r11=205(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 147
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 32
LDI r7, 271
LDI r8, 183
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 205
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
