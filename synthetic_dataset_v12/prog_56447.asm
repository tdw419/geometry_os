; DESCRIPTION: Creates a blue rectangular region at (67, 12) spanning 51 by 71 pixels.
; PLAN: r0=67(x), r1=12(y), r2=51(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 12
LDI r2, 51
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
