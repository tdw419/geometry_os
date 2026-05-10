; DESCRIPTION: Creates a magenta rectangular region at (78, 43) spanning 31 by 120 pixels.
; PLAN: r0=78(x), r1=43(y), r2=31(width), r3=120(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 43
LDI r2, 31
LDI r3, 120
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
