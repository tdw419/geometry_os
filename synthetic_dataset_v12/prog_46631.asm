; DESCRIPTION: Creates a purple rectangular region at (240, 77) spanning 41 by 67 pixels.
; PLAN: r0=240(x), r1=77(y), r2=41(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 77
LDI r2, 41
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
