; DESCRIPTION: Creates a blue rectangular region at (22, 139) spanning 82 by 41 pixels.
; PLAN: r0=22(x), r1=139(y), r2=82(width), r3=41(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 139
LDI r2, 82
LDI r3, 41
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
