; DESCRIPTION: Renders a blue box of size 53x24 starting at (357, 46).
; PLAN: r0=357(x), r1=46(y), r2=53(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 46
LDI r2, 53
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
