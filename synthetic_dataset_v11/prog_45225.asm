; DESCRIPTION: Renders a blue disk with center (187, 81) and radius 36.
; PLAN: r0=187(x), r1=81(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 81
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
