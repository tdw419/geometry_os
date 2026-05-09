; DESCRIPTION: Renders a blue box of size 25x53 starting at (131, 130).
; PLAN: r0=131(x), r1=130(y), r2=25(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 130
LDI r2, 25
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
