; DESCRIPTION: Composite: Places a yellow 100x88 rectangle at position (172, 90) then Sets a single blue pixel at (468, 125).
; PLAN: r0=172(x), r1=90(y), r2=100(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=125(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 172
LDI r1, 90
LDI r2, 100
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 125
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
