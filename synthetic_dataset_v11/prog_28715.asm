; DESCRIPTION: Renders a purple box of size 51x53 starting at (76, 67).
; PLAN: r0=76(x), r1=67(y), r2=51(width), r3=53(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 67
LDI r2, 51
LDI r3, 53
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
