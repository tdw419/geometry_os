; DESCRIPTION: Renders a blue box of size 39x106 starting at (310, 57).
; PLAN: r0=310(x), r1=57(y), r2=39(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 57
LDI r2, 39
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
