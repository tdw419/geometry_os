; DESCRIPTION: Creates a red filled rectangle of size 22x110 starting at (105, 116).
; PLAN: r0=105(x), r1=116(y), r2=22(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 116
LDI r2, 22
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
