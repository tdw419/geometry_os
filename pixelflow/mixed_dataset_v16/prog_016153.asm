; DESCRIPTION: Renders a blue box of size 92x84 starting at (157, 158).
; PLAN: r0=157(x), r1=158(y), r2=92(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 158
LDI r2, 92
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
