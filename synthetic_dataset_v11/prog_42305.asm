; DESCRIPTION: Renders a yellow box of size 65x105 starting at (19, 81).
; PLAN: r0=19(x), r1=81(y), r2=65(width), r3=105(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 81
LDI r2, 65
LDI r3, 105
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
