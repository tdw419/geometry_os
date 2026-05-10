; DESCRIPTION: Creates a red filled rectangle of size 90x76 starting at (72, 142).
; PLAN: r0=72(x), r1=142(y), r2=90(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 142
LDI r2, 90
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
