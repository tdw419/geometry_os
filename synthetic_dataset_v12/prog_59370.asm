; DESCRIPTION: Places a orange 76x100 rectangle at position (76, 52).
; PLAN: r0=76(x), r1=52(y), r2=76(width), r3=100(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 52
LDI r2, 76
LDI r3, 100
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
