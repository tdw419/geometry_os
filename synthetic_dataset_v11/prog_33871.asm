; DESCRIPTION: Creates a magenta rectangular region at (155, 95) spanning 11 by 68 pixels.
; PLAN: r0=155(x), r1=95(y), r2=11(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 95
LDI r2, 11
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
