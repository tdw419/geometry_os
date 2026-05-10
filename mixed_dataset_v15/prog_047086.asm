; DESCRIPTION: Creates a red filled rectangle of size 37x19 starting at (246, 10).
; PLAN: r0=246(x), r1=10(y), r2=37(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 10
LDI r2, 37
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
