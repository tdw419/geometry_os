; DESCRIPTION: Composite: Places a magenta 13x16 rectangle at position (379, 78) then Sets a single red pixel at (12, 130).
; PLAN: r0=379(x), r1=78(y), r2=13(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=12(x), r6=130(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 379
LDI r1, 78
LDI r2, 13
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 12
LDI r6, 130
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
