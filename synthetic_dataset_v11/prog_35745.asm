; DESCRIPTION: Renders a blue box of size 53x38 starting at (106, 163).
; PLAN: r0=106(x), r1=163(y), r2=53(width), r3=38(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 163
LDI r2, 53
LDI r3, 38
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
