; DESCRIPTION: Creates a red filled rectangle of size 74x45 starting at (394, 190).
; PLAN: r0=394(x), r1=190(y), r2=74(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 190
LDI r2, 74
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
