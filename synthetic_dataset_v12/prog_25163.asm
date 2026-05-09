; DESCRIPTION: Composite: Draws a black circle centered at (342, 123) with radius 64 then Places a blue dot at position (73, 147) then Places a cyan line segment connecting (96, 198) to (126, 240).
; PLAN: r0=342(x), r1=123(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=147(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=96(x1), r11=198(y1), r12=126(x2), r13=240(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 123
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 147
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 96
LDI r11, 198
LDI r12, 126
LDI r13, 240
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
