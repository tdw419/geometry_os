; DESCRIPTION: Composite: Draws a white circle centered at (69, 155) with radius 14 then Renders a white box of size 63x57 starting at (422, 51) then Sets a single black pixel at (315, 48).
; PLAN: r0=69(x), r1=155(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=422(x), r6=51(y), r7=63(width), r8=57(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=315(x), r11=48(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 69
LDI r1, 155
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 422
LDI r6, 51
LDI r7, 63
LDI r8, 57
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 315
LDI r11, 48
LDI r12, 0x000000
PSET r10, r11, r12
HALT
