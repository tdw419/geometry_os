; DESCRIPTION: Creates a red filled rectangle of size 38x23 starting at (36, 157).
; PLAN: r0=36(x), r1=157(y), r2=38(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 157
LDI r2, 38
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
