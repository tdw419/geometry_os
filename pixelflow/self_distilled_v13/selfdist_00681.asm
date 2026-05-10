; DESCRIPTION: Creates a red filled rectangle of size 76x16 starting at (269, 190).
; PLAN: r0=269(x), r1=190(y), r2=76(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 190
LDI r2, 76
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
