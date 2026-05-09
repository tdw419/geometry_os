; DESCRIPTION: Renders a blue box of size 53x73 starting at (113, 133).
; PLAN: r0=113(x), r1=133(y), r2=53(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 133
LDI r2, 53
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
