; DESCRIPTION: Renders a blue box of size 103x100 starting at (53, 104).
; PLAN: r0=53(x), r1=104(y), r2=103(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 104
LDI r2, 103
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
