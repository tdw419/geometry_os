; DESCRIPTION: Creates a magenta filled rectangle of size 22x66 starting at (223, 162).
; PLAN: r0=223(x), r1=162(y), r2=22(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 162
LDI r2, 22
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
