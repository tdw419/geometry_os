; DESCRIPTION: Creates a red filled rectangle of size 12x58 starting at (367, 11).
; PLAN: r0=367(x), r1=11(y), r2=12(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 11
LDI r2, 12
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
