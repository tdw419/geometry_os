; DESCRIPTION: Creates a red filled rectangle of size 83x67 starting at (36, 106).
; PLAN: r0=36(x), r1=106(y), r2=83(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 106
LDI r2, 83
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
