; DESCRIPTION: Creates a red filled rectangle of size 18x12 starting at (274, 59).
; PLAN: r0=274(x), r1=59(y), r2=18(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 59
LDI r2, 18
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
