; DESCRIPTION: Composite: Draws a cyan line from (505, 3) to (227, 246) then Sets a single black pixel at (192, 49).
; PLAN: r0=505(x1), r1=3(y1), r2=227(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=192(x), r6=49(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 505
LDI r1, 3
LDI r2, 227
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 192
LDI r6, 49
LDI r7, 0x000000
PSET r5, r6, r7
HALT
