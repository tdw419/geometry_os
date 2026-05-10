; DESCRIPTION: Creates a red filled rectangle of size 93x79 starting at (76, 13).
; PLAN: r0=76(x), r1=13(y), r2=93(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 13
LDI r2, 93
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
