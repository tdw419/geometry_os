; DESCRIPTION: Creates a magenta rectangular region at (47, 7) spanning 102 by 81 pixels.
; PLAN: r0=47(x), r1=7(y), r2=102(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 7
LDI r2, 102
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
