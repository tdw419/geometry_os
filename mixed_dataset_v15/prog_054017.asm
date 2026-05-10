; DESCRIPTION: Composite: Creates a white circular shape at (436, 73) with radius 48 then Sets a single black pixel at (155, 212) then Places a cyan line segment connecting (89, 135) to (309, 209).
; PLAN: r0=436(x), r1=73(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x), r6=212(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=89(x1), r11=135(y1), r12=309(x2), r13=209(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 73
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 212
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 89
LDI r11, 135
LDI r12, 309
LDI r13, 209
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
