; DESCRIPTION: Renders a blue disk with center (57, 202) and radius 28.
; PLAN: r0=57(x), r1=202(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 202
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
