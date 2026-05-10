; DESCRIPTION: Creates a red filled rectangle of size 13x64 starting at (107, 38).
; PLAN: r0=107(x), r1=38(y), r2=13(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 38
LDI r2, 13
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
