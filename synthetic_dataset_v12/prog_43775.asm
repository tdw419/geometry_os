; DESCRIPTION: Creates a magenta rectangular region at (139, 15) spanning 119 by 41 pixels.
; PLAN: r0=139(x), r1=15(y), r2=119(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 15
LDI r2, 119
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
