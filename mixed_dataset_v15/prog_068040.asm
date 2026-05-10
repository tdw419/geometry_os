; DESCRIPTION: Creates a magenta rectangular region at (429, 83) spanning 25 by 100 pixels.
; PLAN: r0=429(x), r1=83(y), r2=25(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 83
LDI r2, 25
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
