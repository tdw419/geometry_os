; DESCRIPTION: Places a orange 19x52 rectangle at position (477, 135).
; PLAN: r0=477(x), r1=135(y), r2=19(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 135
LDI r2, 19
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
