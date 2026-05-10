; DESCRIPTION: Composite: Sets a single cyan pixel at (305, 71) then Draws a black circle centered at (98, 106) with radius 78 then Places a black line segment connecting (15, 238) to (287, 138).
; PLAN: r0=305(x), r1=71(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=106(y), r7=78(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=15(x1), r11=238(y1), r12=287(x2), r13=138(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 71
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 98
LDI r6, 106
LDI r7, 78
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 15
LDI r11, 238
LDI r12, 287
LDI r13, 138
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
