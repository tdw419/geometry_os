; DESCRIPTION: Renders a green disk with center (184, 220) and radius 24.
; PLAN: r0=184(x), r1=220(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 184
LDI r1, 220
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
