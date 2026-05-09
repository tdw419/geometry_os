; DESCRIPTION: Creates a purple rectangular region at (41, 122) spanning 82 by 14 pixels.
; PLAN: r0=41(x), r1=122(y), r2=82(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 122
LDI r2, 82
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
