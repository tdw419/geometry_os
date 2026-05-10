; DESCRIPTION: Composite: Places a orange 52x101 rectangle at position (396, 117) then Sets a single red pixel at (430, 203).
; PLAN: r0=396(x), r1=117(y), r2=52(width), r3=101(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=430(x), r6=203(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 396
LDI r1, 117
LDI r2, 52
LDI r3, 101
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 203
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
