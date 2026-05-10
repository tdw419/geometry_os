; DESCRIPTION: Creates a magenta filled rectangle of size 42x18 starting at (307, 158).
; PLAN: r0=307(x), r1=158(y), r2=42(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 158
LDI r2, 42
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
