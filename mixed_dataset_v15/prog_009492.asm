; DESCRIPTION: Creates a red filled rectangle of size 87x85 starting at (257, 149).
; PLAN: r0=257(x), r1=149(y), r2=87(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 149
LDI r2, 87
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
