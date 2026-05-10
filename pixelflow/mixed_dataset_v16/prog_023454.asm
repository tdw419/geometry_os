; DESCRIPTION: Creates a red filled rectangle of size 39x89 starting at (28, 28).
; PLAN: r0=28(x), r1=28(y), r2=39(width), r3=89(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 28
LDI r2, 39
LDI r3, 89
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
