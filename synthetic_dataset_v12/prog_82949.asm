; DESCRIPTION: Places a orange 76x26 rectangle at position (182, 3).
; PLAN: r0=182(x), r1=3(y), r2=76(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 3
LDI r2, 76
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
