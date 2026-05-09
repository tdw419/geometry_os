; DESCRIPTION: Creates a magenta rectangular region at (306, 115) spanning 60 by 101 pixels.
; PLAN: r0=306(x), r1=115(y), r2=60(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 115
LDI r2, 60
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
