; DESCRIPTION: Composite: Places a blue 43x36 rectangle at position (407, 145) then Sets a single yellow pixel at (224, 52).
; PLAN: r0=407(x), r1=145(y), r2=43(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x), r6=52(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 407
LDI r1, 145
LDI r2, 43
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 52
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
