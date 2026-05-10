; DESCRIPTION: Creates a red filled rectangle of size 64x106 starting at (61, 109).
; PLAN: r0=61(x), r1=109(y), r2=64(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 109
LDI r2, 64
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
