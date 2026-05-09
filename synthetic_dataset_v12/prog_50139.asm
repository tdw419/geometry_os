; DESCRIPTION: Creates a purple rectangular region at (37, 28) spanning 41 by 75 pixels.
; PLAN: r0=37(x), r1=28(y), r2=41(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 28
LDI r2, 41
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
