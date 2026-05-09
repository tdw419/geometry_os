; DESCRIPTION: Renders a blue box of size 108x58 starting at (83, 84).
; PLAN: r0=83(x), r1=84(y), r2=108(width), r3=58(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 84
LDI r2, 108
LDI r3, 58
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
