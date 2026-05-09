; DESCRIPTION: Renders a blue disk with center (184, 164) and radius 50.
; PLAN: r0=184(x), r1=164(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 164
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
