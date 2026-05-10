; DESCRIPTION: Creates a red filled rectangle of size 34x26 starting at (70, 90).
; PLAN: r0=70(x), r1=90(y), r2=34(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 90
LDI r2, 34
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
