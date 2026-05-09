; DESCRIPTION: Places a orange 98x31 rectangle at position (351, 122).
; PLAN: r0=351(x), r1=122(y), r2=98(width), r3=31(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 122
LDI r2, 98
LDI r3, 31
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
