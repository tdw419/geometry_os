; DESCRIPTION: Creates a magenta filled rectangle of size 90x19 starting at (111, 53).
; PLAN: r0=111(x), r1=53(y), r2=90(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 53
LDI r2, 90
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
