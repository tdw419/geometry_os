; DESCRIPTION: Renders a purple box of size 100x92 starting at (8, 53).
; PLAN: r0=8(x), r1=53(y), r2=100(width), r3=92(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 53
LDI r2, 100
LDI r3, 92
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
