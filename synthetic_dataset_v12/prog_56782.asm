; DESCRIPTION: Renders a blue box of size 67x66 starting at (324, 35).
; PLAN: r0=324(x), r1=35(y), r2=67(width), r3=66(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 35
LDI r2, 67
LDI r3, 66
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
