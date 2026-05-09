; DESCRIPTION: Renders a blue disk with center (156, 178) and radius 32.
; PLAN: r0=156(x), r1=178(y), r2=32(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 178
LDI r2, 32
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
