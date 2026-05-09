; DESCRIPTION: Renders a yellow disk with center (197, 111) and radius 18.
; PLAN: r0=197(x), r1=111(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 111
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
