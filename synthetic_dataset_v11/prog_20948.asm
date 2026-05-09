; DESCRIPTION: Renders a blue box of size 108x29 starting at (48, 116).
; PLAN: r0=48(x), r1=116(y), r2=108(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 116
LDI r2, 108
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
