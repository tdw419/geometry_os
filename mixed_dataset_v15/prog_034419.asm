; DESCRIPTION: Creates a red filled rectangle of size 39x118 starting at (60, 127).
; PLAN: r0=60(x), r1=127(y), r2=39(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 127
LDI r2, 39
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
