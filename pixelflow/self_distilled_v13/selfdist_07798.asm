; DESCRIPTION: Creates a red filled rectangle of size 114x57 starting at (245, 97).
; PLAN: r0=245(x), r1=97(y), r2=114(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 97
LDI r2, 114
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
