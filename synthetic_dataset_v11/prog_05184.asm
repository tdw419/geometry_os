; DESCRIPTION: Renders a blue disk with center (173, 168) and radius 51.
; PLAN: r0=173(x), r1=168(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 168
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
