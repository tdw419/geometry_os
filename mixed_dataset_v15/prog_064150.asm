; DESCRIPTION: Places a orange 84x85 rectangle at position (56, 73).
; PLAN: r0=56(x), r1=73(y), r2=84(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 73
LDI r2, 84
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
