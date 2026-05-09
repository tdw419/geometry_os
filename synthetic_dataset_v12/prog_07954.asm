; DESCRIPTION: Composite: Places a purple dot at position (299, 233) then Places a blue line segment connecting (62, 37) to (43, 178) then Draws a magenta circle centered at (286, 142) with radius 35.
; PLAN: r0=299(x), r1=233(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=62(x1), r6=37(y1), r7=43(x2), r8=178(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=286(x), r11=142(y), r12=35(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 299
LDI r1, 233
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 62
LDI r6, 37
LDI r7, 43
LDI r8, 178
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 142
LDI r12, 35
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
