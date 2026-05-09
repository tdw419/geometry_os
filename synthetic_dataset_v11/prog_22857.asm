; DESCRIPTION: Creates a magenta rectangular region at (68, 76) spanning 15 by 86 pixels.
; PLAN: r0=68(x), r1=76(y), r2=15(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 76
LDI r2, 15
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
