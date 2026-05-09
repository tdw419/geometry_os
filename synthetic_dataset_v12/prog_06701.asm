; DESCRIPTION: Renders a black disk with center (327, 180) and radius 63.
; PLAN: r0=327(x), r1=180(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 327
LDI r1, 180
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
