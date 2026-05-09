; DESCRIPTION: Creates a purple rectangular region at (41, 70) spanning 25 by 96 pixels.
; PLAN: r0=41(x), r1=70(y), r2=25(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 70
LDI r2, 25
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
