; DESCRIPTION: Creates a yellow filled rectangle of size 14x38 starting at (301, 190).
; PLAN: r0=301(x), r1=190(y), r2=14(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 190
LDI r2, 14
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
