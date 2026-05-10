; DESCRIPTION: Creates a orange filled rectangle of size 76x26 starting at (168, 61).
; PLAN: r0=168(x), r1=61(y), r2=76(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 61
LDI r2, 76
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
