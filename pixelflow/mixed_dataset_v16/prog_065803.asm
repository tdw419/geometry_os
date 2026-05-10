; DESCRIPTION: Renders a blue box of size 73x96 starting at (353, 25).
; PLAN: r0=353(x), r1=25(y), r2=73(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 25
LDI r2, 73
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
