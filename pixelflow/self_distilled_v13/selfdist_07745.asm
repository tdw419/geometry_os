; DESCRIPTION: Creates a orange filled rectangle of size 93x119 starting at (11, 42).
; PLAN: r0=11(x), r1=42(y), r2=93(width), r3=119(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 42
LDI r2, 93
LDI r3, 119
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
