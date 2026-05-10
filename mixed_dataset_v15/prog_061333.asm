; DESCRIPTION: Composite: Draws a black rectangle at (465, 147) with width 44 and height 80 then Sets a single white pixel at (31, 72).
; PLAN: r0=465(x), r1=147(y), r2=44(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=31(x), r6=72(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 465
LDI r1, 147
LDI r2, 44
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 72
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
