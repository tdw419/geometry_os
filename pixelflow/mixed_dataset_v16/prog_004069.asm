; DESCRIPTION: Creates a purple rectangular region at (9, 180) spanning 117 by 41 pixels.
; PLAN: r0=9(x), r1=180(y), r2=117(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 180
LDI r2, 117
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
