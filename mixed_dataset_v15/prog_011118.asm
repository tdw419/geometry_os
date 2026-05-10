; DESCRIPTION: Composite: Places a purple line segment connecting (247, 247) to (436, 239) then Creates a black circular shape at (38, 167) with radius 25 then Places a orange dot at position (154, 193).
; PLAN: r0=247(x1), r1=247(y1), r2=436(x2), r3=239(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=167(y), r7=25(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=154(x), r11=193(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 247
LDI r1, 247
LDI r2, 436
LDI r3, 239
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 167
LDI r7, 25
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 154
LDI r11, 193
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
