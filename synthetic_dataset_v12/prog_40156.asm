; DESCRIPTION: Composite: Places a orange 29x19 rectangle at position (48, 77) then Sets a single red pixel at (326, 248).
; PLAN: r0=48(x), r1=77(y), r2=29(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x), r6=248(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 48
LDI r1, 77
LDI r2, 29
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 248
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
