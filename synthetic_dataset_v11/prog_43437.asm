; DESCRIPTION: Renders a magenta disk with center (197, 204) and radius 20.
; PLAN: r0=197(x), r1=204(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 204
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
