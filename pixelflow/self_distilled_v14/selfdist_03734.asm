; DESCRIPTION: Creates a magenta filled rectangle of size 110x57 starting at (380, 79).
; PLAN: r0=380(x), r1=79(y), r2=110(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 79
LDI r2, 110
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
