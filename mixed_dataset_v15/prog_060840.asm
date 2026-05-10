; DESCRIPTION: Composite: Places a purple circle of radius 71 at center (81, 76) then Draws a white line from (259, 213) to (452, 102) then Places a black dot at position (364, 71).
; PLAN: r0=81(x), r1=76(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=259(x1), r6=213(y1), r7=452(x2), r8=102(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=364(x), r11=71(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 76
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 259
LDI r6, 213
LDI r7, 452
LDI r8, 102
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 71
LDI r12, 0x000000
PSET r10, r11, r12
HALT
