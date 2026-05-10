; DESCRIPTION: Creates a magenta filled rectangle of size 22x13 starting at (353, 5).
; PLAN: r0=353(x), r1=5(y), r2=22(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 5
LDI r2, 22
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
