; DESCRIPTION: Creates a red filled rectangle of size 60x40 starting at (304, 41).
; PLAN: r0=304(x), r1=41(y), r2=60(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 41
LDI r2, 60
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
