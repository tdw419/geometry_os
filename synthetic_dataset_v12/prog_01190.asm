; DESCRIPTION: Creates a magenta rectangular region at (33, 46) spanning 102 by 101 pixels.
; PLAN: r0=33(x), r1=46(y), r2=102(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 46
LDI r2, 102
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
