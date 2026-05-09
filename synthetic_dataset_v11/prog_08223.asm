; DESCRIPTION: Creates a magenta rectangular region at (1, 138) spanning 60 by 67 pixels.
; PLAN: r0=1(x), r1=138(y), r2=60(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 138
LDI r2, 60
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
