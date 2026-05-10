; DESCRIPTION: Creates a magenta filled rectangle of size 13x101 starting at (152, 134).
; PLAN: r0=152(x), r1=134(y), r2=13(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 134
LDI r2, 13
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
