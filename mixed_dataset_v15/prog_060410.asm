; DESCRIPTION: Creates a magenta filled rectangle of size 109x57 starting at (293, 87).
; PLAN: r0=293(x), r1=87(y), r2=109(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 87
LDI r2, 109
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
