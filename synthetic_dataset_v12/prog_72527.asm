; DESCRIPTION: Renders a blue box of size 15x111 starting at (494, 5).
; PLAN: r0=494(x), r1=5(y), r2=15(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 5
LDI r2, 15
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
