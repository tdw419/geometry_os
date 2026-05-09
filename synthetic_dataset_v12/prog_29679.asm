; DESCRIPTION: Renders a green disk with center (120, 111) and radius 25.
; PLAN: r0=120(x), r1=111(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 111
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
