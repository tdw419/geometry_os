; DESCRIPTION: Creates a magenta rectangular region at (380, 158) spanning 72 by 96 pixels.
; PLAN: r0=380(x), r1=158(y), r2=72(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 158
LDI r2, 72
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
