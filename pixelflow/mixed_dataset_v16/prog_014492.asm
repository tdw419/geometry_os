; DESCRIPTION: Places a orange 31x56 rectangle at position (143, 63).
; PLAN: r0=143(x), r1=63(y), r2=31(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 63
LDI r2, 31
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
