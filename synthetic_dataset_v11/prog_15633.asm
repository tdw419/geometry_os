; DESCRIPTION: Creates a magenta rectangular region at (204, 89) spanning 41 by 66 pixels.
; PLAN: r0=204(x), r1=89(y), r2=41(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 89
LDI r2, 41
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
