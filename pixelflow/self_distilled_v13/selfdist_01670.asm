; DESCRIPTION: Creates a red filled rectangle of size 115x107 starting at (32, 81).
; PLAN: r0=32(x), r1=81(y), r2=115(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 81
LDI r2, 115
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
