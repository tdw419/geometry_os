; DESCRIPTION: Renders a white disk with center (86, 127) and radius 80.
; PLAN: r0=86(x), r1=127(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 127
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
