; DESCRIPTION: Composite: Draws a blue rectangle at (183, 101) with width 107 and height 71 then Draws a blue line from (383, 55) to (268, 182) then Sets a single blue pixel at (436, 97).
; PLAN: r0=183(x), r1=101(y), r2=107(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x1), r6=55(y1), r7=268(x2), r8=182(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=436(x), r11=97(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 183
LDI r1, 101
LDI r2, 107
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 55
LDI r7, 268
LDI r8, 182
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 97
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
