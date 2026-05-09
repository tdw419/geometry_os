; DESCRIPTION: Composite: Places a green line segment connecting (22, 183) to (273, 144) then Draws a purple circle centered at (43, 173) with radius 23 then Places a green dot at position (405, 91).
; PLAN: r0=22(x1), r1=183(y1), r2=273(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=173(y), r7=23(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=405(x), r11=91(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 22
LDI r1, 183
LDI r2, 273
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 173
LDI r7, 23
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 405
LDI r11, 91
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
