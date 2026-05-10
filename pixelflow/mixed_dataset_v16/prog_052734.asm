; DESCRIPTION: Creates a magenta filled rectangle of size 56x12 starting at (85, 109).
; PLAN: r0=85(x), r1=109(y), r2=56(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 109
LDI r2, 56
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
