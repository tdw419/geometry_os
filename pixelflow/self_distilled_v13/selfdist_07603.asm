; DESCRIPTION: Creates a magenta filled rectangle of size 89x87 starting at (242, 63).
; PLAN: r0=242(x), r1=63(y), r2=89(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 63
LDI r2, 89
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
