; DESCRIPTION: Renders a yellow box of size 35x108 starting at (350, 130).
; PLAN: r0=350(x), r1=130(y), r2=35(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 130
LDI r2, 35
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
