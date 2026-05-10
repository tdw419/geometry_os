; DESCRIPTION: Creates a magenta rectangular region at (429, 98) spanning 72 by 35 pixels.
; PLAN: r0=429(x), r1=98(y), r2=72(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 98
LDI r2, 72
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
