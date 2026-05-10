; DESCRIPTION: Creates a magenta rectangular region at (318, 140) spanning 74 by 49 pixels.
; PLAN: r0=318(x), r1=140(y), r2=74(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 140
LDI r2, 74
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
