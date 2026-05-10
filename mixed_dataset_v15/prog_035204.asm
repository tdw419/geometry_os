; DESCRIPTION: Creates a magenta filled rectangle of size 25x81 starting at (382, 43).
; PLAN: r0=382(x), r1=43(y), r2=25(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 43
LDI r2, 25
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
