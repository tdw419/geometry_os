; DESCRIPTION: Renders a blue disk with center (182, 233) and radius 20.
; PLAN: r0=182(x), r1=233(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 233
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
