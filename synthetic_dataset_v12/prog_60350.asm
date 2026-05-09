; DESCRIPTION: Renders a magenta box of size 68x77 starting at (343, 122).
; PLAN: r0=343(x), r1=122(y), r2=68(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 122
LDI r2, 68
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
