; DESCRIPTION: Renders a blue box of size 33x35 starting at (252, 19).
; PLAN: r0=252(x), r1=19(y), r2=33(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 19
LDI r2, 33
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
