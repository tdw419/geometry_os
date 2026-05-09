; DESCRIPTION: Creates a magenta rectangular region at (343, 14) spanning 76 by 46 pixels.
; PLAN: r0=343(x), r1=14(y), r2=76(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 14
LDI r2, 76
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
