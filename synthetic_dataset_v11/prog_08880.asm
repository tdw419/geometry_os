; DESCRIPTION: Places a orange 62x78 rectangle at position (78, 157).
; PLAN: r0=78(x), r1=157(y), r2=62(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 157
LDI r2, 62
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
