; DESCRIPTION: Creates a magenta filled rectangle of size 66x32 starting at (302, 65).
; PLAN: r0=302(x), r1=65(y), r2=66(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 65
LDI r2, 66
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
