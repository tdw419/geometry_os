; DESCRIPTION: Renders a purple disk with center (127, 164) and radius 32.
; PLAN: r0=127(x), r1=164(y), r2=32(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 164
LDI r2, 32
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
