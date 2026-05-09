; DESCRIPTION: Creates a magenta rectangular region at (41, 67) spanning 50 by 106 pixels.
; PLAN: r0=41(x), r1=67(y), r2=50(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 67
LDI r2, 50
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
