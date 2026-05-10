; DESCRIPTION: Creates a red filled rectangle of size 40x118 starting at (278, 12).
; PLAN: r0=278(x), r1=12(y), r2=40(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 12
LDI r2, 40
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
