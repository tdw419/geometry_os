; DESCRIPTION: Creates a magenta rectangular region at (419, 6) spanning 76 by 62 pixels.
; PLAN: r0=419(x), r1=6(y), r2=76(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 6
LDI r2, 76
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
