; DESCRIPTION: Creates a green filled rectangle of size 87x23 starting at (18, 156).
; PLAN: r0=18(x), r1=156(y), r2=87(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 156
LDI r2, 87
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
