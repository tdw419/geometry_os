; DESCRIPTION: Renders a green disk with center (329, 50) and radius 29.
; PLAN: r0=329(x), r1=50(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 50
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
