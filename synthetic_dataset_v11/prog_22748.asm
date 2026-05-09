; DESCRIPTION: Creates a magenta rectangular region at (213, 92) spanning 30 by 88 pixels.
; PLAN: r0=213(x), r1=92(y), r2=30(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 92
LDI r2, 30
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
