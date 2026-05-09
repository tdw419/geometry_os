; DESCRIPTION: Renders a blue box of size 12x111 starting at (139, 2).
; PLAN: r0=139(x), r1=2(y), r2=12(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 2
LDI r2, 12
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
