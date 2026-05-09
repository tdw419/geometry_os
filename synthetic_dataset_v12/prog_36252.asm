; DESCRIPTION: Creates a magenta rectangular region at (68, 45) spanning 29 by 78 pixels.
; PLAN: r0=68(x), r1=45(y), r2=29(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 45
LDI r2, 29
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
