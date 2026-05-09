; DESCRIPTION: Creates a magenta rectangular region at (75, 122) spanning 72 by 90 pixels.
; PLAN: r0=75(x), r1=122(y), r2=72(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 122
LDI r2, 72
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
