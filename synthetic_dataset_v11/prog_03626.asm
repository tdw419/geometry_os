; DESCRIPTION: Places a orange 105x49 rectangle at position (19, 73).
; PLAN: r0=19(x), r1=73(y), r2=105(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 73
LDI r2, 105
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
