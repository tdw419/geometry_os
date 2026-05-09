; DESCRIPTION: Composite: Draws a black rectangle at (250, 178) with width 77 and height 59 then Sets a single blue pixel at (282, 182).
; PLAN: r0=250(x), r1=178(y), r2=77(width), r3=59(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x), r6=182(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 178
LDI r2, 77
LDI r3, 59
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 182
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
