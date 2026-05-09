; DESCRIPTION: Renders a blue box of size 111x28 starting at (90, 122).
; PLAN: r0=90(x), r1=122(y), r2=111(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 122
LDI r2, 111
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
