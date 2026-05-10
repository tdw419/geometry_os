; DESCRIPTION: Creates a magenta filled rectangle of size 22x10 starting at (321, 4).
; PLAN: r0=321(x), r1=4(y), r2=22(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 4
LDI r2, 22
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
