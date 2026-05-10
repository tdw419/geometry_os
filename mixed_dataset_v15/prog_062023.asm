; DESCRIPTION: Composite: Draws a black rectangle at (71, 54) with width 102 and height 57 then Sets a single yellow pixel at (408, 236).
; PLAN: r0=71(x), r1=54(y), r2=102(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=236(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 71
LDI r1, 54
LDI r2, 102
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 236
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
