; DESCRIPTION: Creates a magenta filled rectangle of size 55x60 starting at (307, 189).
; PLAN: r0=307(x), r1=189(y), r2=55(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 189
LDI r2, 55
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
