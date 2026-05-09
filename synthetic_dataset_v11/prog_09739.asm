; DESCRIPTION: Places a orange 105x38 rectangle at position (109, 97).
; PLAN: r0=109(x), r1=97(y), r2=105(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 97
LDI r2, 105
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
