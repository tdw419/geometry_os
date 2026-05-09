; DESCRIPTION: Composite: Draws a red circle centered at (307, 102) with radius 11 then Sets a single purple pixel at (416, 62).
; PLAN: r0=307(x), r1=102(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x), r6=62(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 307
LDI r1, 102
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 62
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
