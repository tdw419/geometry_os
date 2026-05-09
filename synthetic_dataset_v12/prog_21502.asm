; DESCRIPTION: Renders a blue box of size 111x35 starting at (291, 178).
; PLAN: r0=291(x), r1=178(y), r2=111(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 178
LDI r2, 111
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
