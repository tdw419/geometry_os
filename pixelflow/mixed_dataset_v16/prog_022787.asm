; DESCRIPTION: Renders a yellow disk with center (220, 72) and radius 32.
; PLAN: r0=220(x), r1=72(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 72
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
