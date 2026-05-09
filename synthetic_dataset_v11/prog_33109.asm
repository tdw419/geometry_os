; DESCRIPTION: Creates a magenta rectangular region at (114, 2) spanning 75 by 60 pixels.
; PLAN: r0=114(x), r1=2(y), r2=75(width), r3=60(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 2
LDI r2, 75
LDI r3, 60
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
