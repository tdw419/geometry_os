; DESCRIPTION: Creates a magenta filled rectangle of size 22x36 starting at (15, 84).
; PLAN: r0=15(x), r1=84(y), r2=22(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 84
LDI r2, 22
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
