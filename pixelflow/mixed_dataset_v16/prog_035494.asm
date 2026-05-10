; DESCRIPTION: Renders a green box of size 67x51 starting at (315, 122).
; PLAN: r0=315(x), r1=122(y), r2=67(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 122
LDI r2, 67
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
