; DESCRIPTION: Creates a red filled rectangle of size 12x113 starting at (397, 157).
; PLAN: r0=397(x), r1=157(y), r2=12(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 157
LDI r2, 12
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
