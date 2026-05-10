; DESCRIPTION: Creates a magenta rectangular region at (396, 38) spanning 60 by 74 pixels.
; PLAN: r0=396(x), r1=38(y), r2=60(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 38
LDI r2, 60
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
