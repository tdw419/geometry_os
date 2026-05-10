; DESCRIPTION: Composite: Draws a red rectangle at (5, 127) with width 109 and height 119 then Sets a single red pixel at (371, 219).
; PLAN: r0=5(x), r1=127(y), r2=109(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x), r6=219(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 5
LDI r1, 127
LDI r2, 109
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 219
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
