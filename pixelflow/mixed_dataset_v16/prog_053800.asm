; DESCRIPTION: Composite: Draws a red circle centered at (283, 182) with radius 55 then Places a magenta line segment connecting (366, 107) to (61, 75) then Places a black dot at position (477, 39).
; PLAN: r0=283(x), r1=182(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=366(x1), r6=107(y1), r7=61(x2), r8=75(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=477(x), r11=39(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 283
LDI r1, 182
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 366
LDI r6, 107
LDI r7, 61
LDI r8, 75
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 477
LDI r11, 39
LDI r12, 0x000000
PSET r10, r11, r12
HALT
