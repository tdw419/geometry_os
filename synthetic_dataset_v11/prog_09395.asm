; DESCRIPTION: Creates a magenta rectangular region at (79, 163) spanning 73 by 41 pixels.
; PLAN: r0=79(x), r1=163(y), r2=73(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 163
LDI r2, 73
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
