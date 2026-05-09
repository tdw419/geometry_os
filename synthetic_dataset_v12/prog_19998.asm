; DESCRIPTION: Renders a blue box of size 64x25 starting at (157, 58).
; PLAN: r0=157(x), r1=58(y), r2=64(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 58
LDI r2, 64
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
