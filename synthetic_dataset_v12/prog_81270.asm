; DESCRIPTION: Composite: Draws a purple line from (35, 76) to (467, 165) then Sets a single blue pixel at (511, 59) then Draws a white rectangle at (111, 213) with width 61 and height 32.
; PLAN: r0=35(x1), r1=76(y1), r2=467(x2), r3=165(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=511(x), r6=59(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=111(x), r11=213(y), r12=61(width), r13=32(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 76
LDI r2, 467
LDI r3, 165
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 511
LDI r6, 59
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 111
LDI r11, 213
LDI r12, 61
LDI r13, 32
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
