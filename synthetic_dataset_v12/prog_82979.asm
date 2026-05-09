; DESCRIPTION: Places a orange 29x76 rectangle at position (43, 26).
; PLAN: r0=43(x), r1=26(y), r2=29(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 26
LDI r2, 29
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
