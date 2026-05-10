; DESCRIPTION: Creates a magenta filled rectangle of size 64x22 starting at (165, 183).
; PLAN: r0=165(x), r1=183(y), r2=64(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 183
LDI r2, 64
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
