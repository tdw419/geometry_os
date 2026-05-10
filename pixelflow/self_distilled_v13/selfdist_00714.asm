; DESCRIPTION: Creates a red filled rectangle of size 109x116 starting at (258, 108).
; PLAN: r0=258(x), r1=108(y), r2=109(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 108
LDI r2, 109
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
