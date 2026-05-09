; DESCRIPTION: Renders a blue disk with center (252, 153) and radius 50.
; PLAN: r0=252(x), r1=153(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 153
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
