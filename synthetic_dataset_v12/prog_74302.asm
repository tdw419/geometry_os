; DESCRIPTION: Creates a magenta rectangular region at (11, 167) spanning 107 by 13 pixels.
; PLAN: r0=11(x), r1=167(y), r2=107(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 167
LDI r2, 107
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
