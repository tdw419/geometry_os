; DESCRIPTION: Creates a green filled rectangle of size 84x111 starting at (343, 36).
; PLAN: r0=343(x), r1=36(y), r2=84(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 36
LDI r2, 84
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
