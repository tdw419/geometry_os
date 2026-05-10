; DESCRIPTION: Creates a red filled rectangle of size 52x35 starting at (107, 16).
; PLAN: r0=107(x), r1=16(y), r2=52(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 16
LDI r2, 52
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
