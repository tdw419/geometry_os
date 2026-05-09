; DESCRIPTION: Creates a magenta rectangular region at (27, 102) spanning 114 by 100 pixels.
; PLAN: r0=27(x), r1=102(y), r2=114(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 102
LDI r2, 114
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
