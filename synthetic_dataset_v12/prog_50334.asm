; DESCRIPTION: Composite: Draws a orange line from (63, 165) to (494, 59) then Sets a single purple pixel at (5, 182) then Draws a yellow rectangle at (126, 102) with width 106 and height 52.
; PLAN: r0=63(x1), r1=165(y1), r2=494(x2), r3=59(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=182(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=126(x), r11=102(y), r12=106(width), r13=52(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 63
LDI r1, 165
LDI r2, 494
LDI r3, 59
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 182
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 126
LDI r11, 102
LDI r12, 106
LDI r13, 52
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
