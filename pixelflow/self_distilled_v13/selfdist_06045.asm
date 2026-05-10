; DESCRIPTION: Creates a red filled rectangle of size 17x76 starting at (218, 81).
; PLAN: r0=218(x), r1=81(y), r2=17(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 81
LDI r2, 17
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
