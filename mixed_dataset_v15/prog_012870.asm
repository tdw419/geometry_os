; DESCRIPTION: Creates a red filled rectangle of size 84x114 starting at (331, 149).
; PLAN: r0=331(x), r1=149(y), r2=84(width), r3=114(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 149
LDI r2, 84
LDI r3, 114
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
