; DESCRIPTION: Renders a blue box of size 40x100 starting at (11, 139).
; PLAN: r0=11(x), r1=139(y), r2=40(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 139
LDI r2, 40
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
