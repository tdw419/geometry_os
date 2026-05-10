; DESCRIPTION: Creates a yellow filled rectangle of size 107x49 starting at (301, 182).
; PLAN: r0=301(x), r1=182(y), r2=107(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 182
LDI r2, 107
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
