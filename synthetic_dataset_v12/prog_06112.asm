; DESCRIPTION: Creates a magenta rectangular region at (423, 110) spanning 41 by 110 pixels.
; PLAN: r0=423(x), r1=110(y), r2=41(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 110
LDI r2, 41
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
