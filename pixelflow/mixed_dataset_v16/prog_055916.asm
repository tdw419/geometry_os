; DESCRIPTION: Creates a magenta filled rectangle of size 100x38 starting at (79, 59).
; PLAN: r0=79(x), r1=59(y), r2=100(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 59
LDI r2, 100
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
