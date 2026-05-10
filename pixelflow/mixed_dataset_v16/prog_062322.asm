; DESCRIPTION: Places a orange 100x23 rectangle at position (299, 87).
; PLAN: r0=299(x), r1=87(y), r2=100(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 87
LDI r2, 100
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
