; DESCRIPTION: Creates a purple rectangular region at (41, 96) spanning 111 by 90 pixels.
; PLAN: r0=41(x), r1=96(y), r2=111(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 96
LDI r2, 111
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
