; DESCRIPTION: Creates a orange filled rectangle of size 62x70 starting at (42, 21).
; PLAN: r0=42(x), r1=21(y), r2=62(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 21
LDI r2, 62
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
