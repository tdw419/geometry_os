; DESCRIPTION: Renders a yellow circular shape at (134, 187) with radius 38.
; PLAN: r0=134(x), r1=187(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 187
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
