; DESCRIPTION: Creates a red filled rectangle of size 70x105 starting at (201, 116).
; PLAN: r0=201(x), r1=116(y), r2=70(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 116
LDI r2, 70
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
