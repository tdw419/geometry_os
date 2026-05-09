; DESCRIPTION: Creates a magenta rectangular region at (478, 39) spanning 18 by 72 pixels.
; PLAN: r0=478(x), r1=39(y), r2=18(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 39
LDI r2, 18
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
