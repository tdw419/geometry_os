; DESCRIPTION: Creates a blue rectangular region at (230, 41) spanning 51 by 67 pixels.
; PLAN: r0=230(x), r1=41(y), r2=51(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 41
LDI r2, 51
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
