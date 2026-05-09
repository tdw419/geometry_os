; DESCRIPTION: Renders a green disk with center (117, 92) and radius 62.
; PLAN: r0=117(x), r1=92(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 92
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
