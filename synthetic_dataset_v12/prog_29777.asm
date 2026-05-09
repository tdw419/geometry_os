; DESCRIPTION: Composite: Draws a purple rectangle at (312, 143) with width 14 and height 59 then Sets a single green pixel at (477, 32).
; PLAN: r0=312(x), r1=143(y), r2=14(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=477(x), r6=32(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 312
LDI r1, 143
LDI r2, 14
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 32
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
