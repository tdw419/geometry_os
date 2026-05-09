; DESCRIPTION: Creates a magenta rectangular region at (24, 140) spanning 38 by 105 pixels.
; PLAN: r0=24(x), r1=140(y), r2=38(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 140
LDI r2, 38
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
