; DESCRIPTION: Places a orange 77x119 box at position (379, 102).
; PLAN: r0=379(x), r1=102(y), r2=77(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 102
LDI r2, 77
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
