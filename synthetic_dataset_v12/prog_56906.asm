; DESCRIPTION: Renders a blue box of size 13x15 starting at (388, 230).
; PLAN: r0=388(x), r1=230(y), r2=13(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 230
LDI r2, 13
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
