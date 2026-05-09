; DESCRIPTION: Composite: Draws a purple line from (414, 19) to (348, 245) then Sets a single green pixel at (182, 17) then Draws a green rectangle at (279, 74) with width 105 and height 31.
; PLAN: r0=414(x1), r1=19(y1), r2=348(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=17(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=279(x), r11=74(y), r12=105(width), r13=31(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 414
LDI r1, 19
LDI r2, 348
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 17
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 279
LDI r11, 74
LDI r12, 105
LDI r13, 31
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
