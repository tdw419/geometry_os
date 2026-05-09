; DESCRIPTION: Creates a purple rectangular region at (314, 41) spanning 64 by 37 pixels.
; PLAN: r0=314(x), r1=41(y), r2=64(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 41
LDI r2, 64
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
