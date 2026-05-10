; DESCRIPTION: Creates a magenta filled rectangle of size 15x72 starting at (304, 95).
; PLAN: r0=304(x), r1=95(y), r2=15(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 95
LDI r2, 15
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
