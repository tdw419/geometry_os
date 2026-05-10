; DESCRIPTION: Composite: Draws a purple rectangle at (383, 22) with width 105 and height 80 then Places a black dot at position (23, 116).
; PLAN: r0=383(x), r1=22(y), r2=105(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x), r6=116(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 383
LDI r1, 22
LDI r2, 105
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 116
LDI r7, 0x000000
PSET r5, r6, r7
HALT
