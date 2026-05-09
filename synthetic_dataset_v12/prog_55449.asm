; DESCRIPTION: Composite: Draws a black rectangle at (307, 147) with width 79 and height 77 then Sets a single green pixel at (328, 202).
; PLAN: r0=307(x), r1=147(y), r2=79(width), r3=77(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x), r6=202(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 307
LDI r1, 147
LDI r2, 79
LDI r3, 77
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 202
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
