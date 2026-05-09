; DESCRIPTION: Places a orange 43x30 rectangle at position (31, 122).
; PLAN: r0=31(x), r1=122(y), r2=43(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 122
LDI r2, 43
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
