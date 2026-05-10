; DESCRIPTION: Creates a red filled rectangle of size 22x101 starting at (305, 194).
; PLAN: r0=305(x), r1=194(y), r2=22(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 194
LDI r2, 22
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
