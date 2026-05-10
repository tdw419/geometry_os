; DESCRIPTION: Composite: Renders a orange line between points (182, 63) and (368, 149) then Draws a purple circle centered at (436, 49) with radius 36 then Places a black dot at position (404, 244).
; PLAN: r0=182(x1), r1=63(y1), r2=368(x2), r3=149(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=49(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=404(x), r11=244(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 182
LDI r1, 63
LDI r2, 368
LDI r3, 149
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 49
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 404
LDI r11, 244
LDI r12, 0x000000
PSET r10, r11, r12
HALT
