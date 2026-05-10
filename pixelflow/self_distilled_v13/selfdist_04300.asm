; DESCRIPTION: Creates a magenta filled rectangle of size 106x111 starting at (35, 158).
; PLAN: r0=35(x), r1=158(y), r2=106(width), r3=111(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 158
LDI r2, 106
LDI r3, 111
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
