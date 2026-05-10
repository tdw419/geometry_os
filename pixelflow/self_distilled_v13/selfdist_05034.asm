; DESCRIPTION: Creates a orange filled rectangle of size 26x62 starting at (185, 190).
; PLAN: r0=185(x), r1=190(y), r2=26(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 190
LDI r2, 26
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
