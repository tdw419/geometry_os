; DESCRIPTION: Places a orange 11x89 box at position (332, 156).
; PLAN: r0=332(x), r1=156(y), r2=11(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 156
LDI r2, 11
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
