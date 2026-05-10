; DESCRIPTION: Creates a red filled rectangle of size 84x12 starting at (380, 2).
; PLAN: r0=380(x), r1=2(y), r2=84(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 2
LDI r2, 84
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
