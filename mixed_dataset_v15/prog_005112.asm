; DESCRIPTION: Composite: Draws a purple circle centered at (436, 84) with radius 69 then Places a black line segment connecting (491, 148) to (509, 33) then Places a purple dot at position (460, 187).
; PLAN: r0=436(x), r1=84(y), r2=69(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=491(x1), r6=148(y1), r7=509(x2), r8=33(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=460(x), r11=187(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 436
LDI r1, 84
LDI r2, 69
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 491
LDI r6, 148
LDI r7, 509
LDI r8, 33
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 187
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
