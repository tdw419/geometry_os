; DESCRIPTION: Creates a magenta rectangular region at (181, 82) spanning 43 by 78 pixels.
; PLAN: r0=181(x), r1=82(y), r2=43(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 82
LDI r2, 43
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
