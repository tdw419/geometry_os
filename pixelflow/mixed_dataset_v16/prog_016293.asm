; DESCRIPTION: Renders a blue box of size 113x108 starting at (250, 116).
; PLAN: r0=250(x), r1=116(y), r2=113(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 116
LDI r2, 113
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
