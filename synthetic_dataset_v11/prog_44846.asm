; DESCRIPTION: Creates a magenta rectangular region at (99, 102) spanning 107 by 94 pixels.
; PLAN: r0=99(x), r1=102(y), r2=107(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 102
LDI r2, 107
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
