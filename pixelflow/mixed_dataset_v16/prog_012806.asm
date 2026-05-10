; DESCRIPTION: Composite: Places a purple line segment connecting (9, 103) to (436, 63) then Draws a magenta circle centered at (73, 135) with radius 72 then Places a black dot at position (385, 130).
; PLAN: r0=9(x1), r1=103(y1), r2=436(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=135(y), r7=72(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=385(x), r11=130(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 9
LDI r1, 103
LDI r2, 436
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 135
LDI r7, 72
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 385
LDI r11, 130
LDI r12, 0x000000
PSET r10, r11, r12
HALT
