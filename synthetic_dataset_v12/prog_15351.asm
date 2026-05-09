; DESCRIPTION: Creates a magenta rectangular region at (381, 41) spanning 101 by 99 pixels.
; PLAN: r0=381(x), r1=41(y), r2=101(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 41
LDI r2, 101
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
