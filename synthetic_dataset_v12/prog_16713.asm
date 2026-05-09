; DESCRIPTION: Renders a red disk with center (64, 166) and radius 51.
; PLAN: r0=64(x), r1=166(y), r2=51(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 166
LDI r2, 51
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
