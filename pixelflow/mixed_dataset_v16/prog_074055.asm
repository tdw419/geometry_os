; DESCRIPTION: Creates a magenta filled rectangle of size 81x98 starting at (251, 182).
; PLAN: r0=251(x), r1=182(y), r2=81(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 182
LDI r2, 81
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
