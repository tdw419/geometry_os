; DESCRIPTION: Renders a blue box of size 72x53 starting at (58, 197).
; PLAN: r0=58(x), r1=197(y), r2=72(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 197
LDI r2, 72
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
