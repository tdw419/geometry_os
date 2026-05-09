; DESCRIPTION: Creates a magenta rectangular region at (78, 53) spanning 45 by 29 pixels.
; PLAN: r0=78(x), r1=53(y), r2=45(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 53
LDI r2, 45
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
