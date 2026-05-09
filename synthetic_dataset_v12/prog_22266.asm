; DESCRIPTION: Renders a blue box of size 35x113 starting at (332, 101).
; PLAN: r0=332(x), r1=101(y), r2=35(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 101
LDI r2, 35
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
