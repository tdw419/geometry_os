; DESCRIPTION: Creates a red filled rectangle of size 93x38 starting at (363, 8).
; PLAN: r0=363(x), r1=8(y), r2=93(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 8
LDI r2, 93
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
