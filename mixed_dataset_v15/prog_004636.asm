; DESCRIPTION: Composite: Renders a magenta disk with center (396, 202) and radius 21 then Renders a blue line between points (284, 222) and (278, 227) then Sets a single purple pixel at (451, 94).
; PLAN: r0=396(x), r1=202(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x1), r6=222(y1), r7=278(x2), r8=227(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=451(x), r11=94(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 396
LDI r1, 202
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 222
LDI r7, 278
LDI r8, 227
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 94
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
