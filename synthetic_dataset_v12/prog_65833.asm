; DESCRIPTION: Renders a blue box of size 45x21 starting at (53, 141).
; PLAN: r0=53(x), r1=141(y), r2=45(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 141
LDI r2, 45
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
