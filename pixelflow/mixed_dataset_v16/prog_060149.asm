; DESCRIPTION: Creates a red filled rectangle of size 64x29 starting at (7, 168).
; PLAN: r0=7(x), r1=168(y), r2=64(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 168
LDI r2, 64
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
