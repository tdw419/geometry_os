; DESCRIPTION: Creates a magenta rectangular region at (34, 27) spanning 35 by 82 pixels.
; PLAN: r0=34(x), r1=27(y), r2=35(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 27
LDI r2, 35
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
