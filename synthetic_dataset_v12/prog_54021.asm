; DESCRIPTION: Creates a magenta rectangular region at (369, 76) spanning 83 by 43 pixels.
; PLAN: r0=369(x), r1=76(y), r2=83(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 76
LDI r2, 83
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
