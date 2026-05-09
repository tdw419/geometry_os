; DESCRIPTION: Renders a magenta disk with center (196, 113) and radius 51.
; PLAN: r0=196(x), r1=113(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 113
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
