; DESCRIPTION: Creates a magenta rectangular region at (134, 62) spanning 105 by 117 pixels.
; PLAN: r0=134(x), r1=62(y), r2=105(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 62
LDI r2, 105
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
