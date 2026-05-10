; DESCRIPTION: Composite: Renders a purple line between points (364, 245) and (310, 254) then Draws a white circle centered at (436, 180) with radius 60 then Places a blue dot at position (148, 92).
; PLAN: r0=364(x1), r1=245(y1), r2=310(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=180(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=148(x), r11=92(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 364
LDI r1, 245
LDI r2, 310
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 180
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 148
LDI r11, 92
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
