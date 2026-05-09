; DESCRIPTION: Places a orange 97x61 rectangle at position (78, 161).
; PLAN: r0=78(x), r1=161(y), r2=97(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 161
LDI r2, 97
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
