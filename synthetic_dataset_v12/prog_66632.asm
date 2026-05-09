; DESCRIPTION: Creates a purple rectangular region at (380, 28) spanning 41 by 18 pixels.
; PLAN: r0=380(x), r1=28(y), r2=41(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 28
LDI r2, 41
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
