; DESCRIPTION: Creates a magenta rectangular region at (322, 181) spanning 96 by 41 pixels.
; PLAN: r0=322(x), r1=181(y), r2=96(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 181
LDI r2, 96
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
