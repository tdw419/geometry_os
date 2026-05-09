; DESCRIPTION: Renders a blue box of size 111x81 starting at (20, 45).
; PLAN: r0=20(x), r1=45(y), r2=111(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 45
LDI r2, 111
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
