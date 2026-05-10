; DESCRIPTION: Places a orange 66x76 rectangle at position (339, 62).
; PLAN: r0=339(x), r1=62(y), r2=66(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 62
LDI r2, 66
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
