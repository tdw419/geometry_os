; DESCRIPTION: Creates a magenta filled rectangle of size 88x112 starting at (218, 60).
; PLAN: r0=218(x), r1=60(y), r2=88(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 60
LDI r2, 88
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
