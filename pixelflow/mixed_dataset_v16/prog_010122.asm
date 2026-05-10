; DESCRIPTION: Composite: Sets a single yellow pixel at (237, 65) then Draws a black circle centered at (298, 63) with radius 46 then Draws a green line from (151, 126) to (457, 104).
; PLAN: r0=237(x), r1=65(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=298(x), r6=63(y), r7=46(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=151(x1), r11=126(y1), r12=457(x2), r13=104(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 65
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 298
LDI r6, 63
LDI r7, 46
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 151
LDI r11, 126
LDI r12, 457
LDI r13, 104
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
