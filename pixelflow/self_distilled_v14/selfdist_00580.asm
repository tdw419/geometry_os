; DESCRIPTION: Creates a red filled rectangle of size 41x49 starting at (294, 187).
; PLAN: r0=294(x), r1=187(y), r2=41(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 187
LDI r2, 41
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
