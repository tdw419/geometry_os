; DESCRIPTION: Creates a magenta filled rectangle of size 103x15 starting at (58, 181).
; PLAN: r0=58(x), r1=181(y), r2=103(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 181
LDI r2, 103
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
