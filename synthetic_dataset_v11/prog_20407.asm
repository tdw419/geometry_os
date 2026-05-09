; DESCRIPTION: Creates a purple rectangular region at (0, 22) spanning 80 by 41 pixels.
; PLAN: r0=0(x), r1=22(y), r2=80(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 22
LDI r2, 80
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
