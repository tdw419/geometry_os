; DESCRIPTION: Renders a yellow box of size 96x108 starting at (65, 105).
; PLAN: r0=65(x), r1=105(y), r2=96(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 105
LDI r2, 96
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
