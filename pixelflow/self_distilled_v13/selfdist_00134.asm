; DESCRIPTION: Creates a red filled rectangle of size 74x116 starting at (363, 11).
; PLAN: r0=363(x), r1=11(y), r2=74(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 11
LDI r2, 74
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
