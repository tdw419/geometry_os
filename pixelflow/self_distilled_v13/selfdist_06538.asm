; DESCRIPTION: Creates a purple diamond shape using 4 lines meeting at the center.
; PLAN: r0=41(x), r1=4(y), r2=92(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 4
LDI r2, 92
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
