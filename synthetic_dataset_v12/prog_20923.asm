; DESCRIPTION: Creates a magenta rectangular region at (93, 45) spanning 11 by 119 pixels.
; PLAN: r0=93(x), r1=45(y), r2=11(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 45
LDI r2, 11
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
