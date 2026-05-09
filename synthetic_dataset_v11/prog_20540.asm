; DESCRIPTION: Renders a yellow box of size 108x66 starting at (29, 72).
; PLAN: r0=29(x), r1=72(y), r2=108(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 72
LDI r2, 108
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
