; DESCRIPTION: Creates a magenta rectangular region at (127, 155) spanning 53 by 41 pixels.
; PLAN: r0=127(x), r1=155(y), r2=53(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 155
LDI r2, 53
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
