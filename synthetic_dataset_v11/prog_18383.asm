; DESCRIPTION: Renders a green disk with center (123, 101) and radius 50.
; PLAN: r0=123(x), r1=101(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 101
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
