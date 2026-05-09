; DESCRIPTION: Creates a magenta rectangular region at (121, 42) spanning 13 by 78 pixels.
; PLAN: r0=121(x), r1=42(y), r2=13(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 42
LDI r2, 13
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
