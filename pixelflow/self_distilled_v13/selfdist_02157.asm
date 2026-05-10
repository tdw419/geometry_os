; DESCRIPTION: Creates a magenta filled rectangle of size 97x81 starting at (353, 18).
; PLAN: r0=353(x), r1=18(y), r2=97(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 18
LDI r2, 97
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
