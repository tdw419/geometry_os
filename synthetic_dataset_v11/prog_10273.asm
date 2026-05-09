; DESCRIPTION: Creates a magenta rectangular region at (6, 36) spanning 24 by 107 pixels.
; PLAN: r0=6(x), r1=36(y), r2=24(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 36
LDI r2, 24
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
