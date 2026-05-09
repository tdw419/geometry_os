; DESCRIPTION: Creates a magenta rectangular region at (71, 3) spanning 15 by 60 pixels.
; PLAN: r0=71(x), r1=3(y), r2=15(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 3
LDI r2, 15
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
