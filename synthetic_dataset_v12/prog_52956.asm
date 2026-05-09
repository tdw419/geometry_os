; DESCRIPTION: Creates a magenta rectangular region at (311, 108) spanning 67 by 74 pixels.
; PLAN: r0=311(x), r1=108(y), r2=67(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 108
LDI r2, 67
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
