; DESCRIPTION: Renders a yellow rectangular region spanning 45 by 45 at (258, 53).
; PLAN: r0=258(x), r1=53(y), r2=45(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 53
LDI r2, 45
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
