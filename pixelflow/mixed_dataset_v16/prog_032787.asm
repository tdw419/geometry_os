; DESCRIPTION: Creates a magenta filled rectangle of size 21x56 starting at (47, 171).
; PLAN: r0=47(x), r1=171(y), r2=21(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 171
LDI r2, 21
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
