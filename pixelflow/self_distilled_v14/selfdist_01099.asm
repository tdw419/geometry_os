; DESCRIPTION: Creates a magenta filled rectangle of size 106x19 starting at (179, 73).
; PLAN: r0=179(x), r1=73(y), r2=106(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 73
LDI r2, 106
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
