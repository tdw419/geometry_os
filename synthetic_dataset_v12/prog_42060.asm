; DESCRIPTION: Renders a blue disk with center (307, 125) and radius 46.
; PLAN: r0=307(x), r1=125(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 125
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
