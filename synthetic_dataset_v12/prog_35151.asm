; DESCRIPTION: Renders a blue box of size 67x81 starting at (161, 167).
; PLAN: r0=161(x), r1=167(y), r2=67(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 167
LDI r2, 67
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
