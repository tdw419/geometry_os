; DESCRIPTION: Creates a magenta rectangular region at (287, 165) spanning 41 by 51 pixels.
; PLAN: r0=287(x), r1=165(y), r2=41(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 165
LDI r2, 41
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
