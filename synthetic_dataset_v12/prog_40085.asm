; DESCRIPTION: Creates a magenta rectangular region at (421, 34) spanning 57 by 76 pixels.
; PLAN: r0=421(x), r1=34(y), r2=57(width), r3=76(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 34
LDI r2, 57
LDI r3, 76
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
