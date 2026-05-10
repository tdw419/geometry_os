; DESCRIPTION: Creates a magenta rectangular region at (153, 81) spanning 50 by 41 pixels.
; PLAN: r0=153(x), r1=81(y), r2=50(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 81
LDI r2, 50
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
