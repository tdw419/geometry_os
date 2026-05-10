; DESCRIPTION: Creates a magenta rectangular region at (41, 74) spanning 37 by 71 pixels.
; PLAN: r0=41(x), r1=74(y), r2=37(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 74
LDI r2, 37
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
