; DESCRIPTION: Composite: Places a orange 84x18 rectangle at position (250, 122) then Sets a single red pixel at (233, 227).
; PLAN: r0=250(x), r1=122(y), r2=84(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x), r6=227(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 250
LDI r1, 122
LDI r2, 84
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 227
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
