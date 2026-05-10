; DESCRIPTION: Renders a green disk with center (113, 140) and radius 32.
; PLAN: r0=113(x), r1=140(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 140
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
