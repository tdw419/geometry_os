; DESCRIPTION: Creates a purple rectangular region at (106, 60) spanning 41 by 84 pixels.
; PLAN: r0=106(x), r1=60(y), r2=41(width), r3=84(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 60
LDI r2, 41
LDI r3, 84
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
