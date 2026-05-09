; DESCRIPTION: Renders a blue box of size 49x82 starting at (449, 137).
; PLAN: r0=449(x), r1=137(y), r2=49(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 137
LDI r2, 49
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
