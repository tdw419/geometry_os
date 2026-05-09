; DESCRIPTION: Creates a magenta rectangular region at (24, 1) spanning 60 by 101 pixels.
; PLAN: r0=24(x), r1=1(y), r2=60(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 1
LDI r2, 60
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
