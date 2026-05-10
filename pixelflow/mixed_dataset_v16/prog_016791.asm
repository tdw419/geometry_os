; DESCRIPTION: Creates a purple rectangular region at (118, 120) spanning 41 by 41 pixels.
; PLAN: r0=118(x), r1=120(y), r2=41(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 120
LDI r2, 41
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
