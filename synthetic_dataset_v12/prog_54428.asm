; DESCRIPTION: Composite: Places a purple line segment connecting (71, 231) to (384, 163) then Places a magenta circle of radius 36 at center (432, 215) then Sets a single black pixel at (431, 43).
; PLAN: r0=71(x1), r1=231(y1), r2=384(x2), r3=163(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=432(x), r6=215(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=431(x), r11=43(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 71
LDI r1, 231
LDI r2, 384
LDI r3, 163
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 215
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 431
LDI r11, 43
LDI r12, 0x000000
PSET r10, r11, r12
HALT
