; DESCRIPTION: Renders a blue box of size 67x33 starting at (210, 118).
; PLAN: r0=210(x), r1=118(y), r2=67(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 118
LDI r2, 67
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
