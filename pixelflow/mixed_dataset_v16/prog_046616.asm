; DESCRIPTION: Renders a blue box of size 76x108 starting at (215, 129).
; PLAN: r0=215(x), r1=129(y), r2=76(width), r3=108(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 129
LDI r2, 76
LDI r3, 108
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
