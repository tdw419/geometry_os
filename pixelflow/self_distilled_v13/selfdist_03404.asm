; DESCRIPTION: Creates a magenta filled rectangle of size 100x85 starting at (107, 129).
; PLAN: r0=107(x), r1=129(y), r2=100(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 129
LDI r2, 100
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
