; DESCRIPTION: Creates a magenta filled rectangle of size 116x36 starting at (271, 7).
; PLAN: r0=271(x), r1=7(y), r2=116(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 7
LDI r2, 116
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
