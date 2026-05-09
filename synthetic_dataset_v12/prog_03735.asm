; DESCRIPTION: Renders a blue box of size 53x44 starting at (103, 100).
; PLAN: r0=103(x), r1=100(y), r2=53(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 100
LDI r2, 53
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
