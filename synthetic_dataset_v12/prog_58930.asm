; DESCRIPTION: Composite: Sets a single yellow pixel at (263, 18) then Draws a yellow circle centered at (119, 98) with radius 53 then Renders a black line between points (141, 57) and (436, 108).
; PLAN: r0=263(x), r1=18(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=119(x), r6=98(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=141(x1), r11=57(y1), r12=436(x2), r13=108(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 18
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 119
LDI r6, 98
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 141
LDI r11, 57
LDI r12, 436
LDI r13, 108
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
