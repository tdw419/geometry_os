; DESCRIPTION: Renders a blue disk with center (294, 176) and radius 75.
; PLAN: r0=294(x), r1=176(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 176
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
