; DESCRIPTION: Composite: Draws a magenta rectangle at (414, 114) with width 17 and height 88 then Sets a single yellow pixel at (187, 115).
; PLAN: r0=414(x), r1=114(y), r2=17(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=115(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 414
LDI r1, 114
LDI r2, 17
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 115
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
