; DESCRIPTION: Renders a magenta disk with center (411, 51) and radius 42.
; PLAN: r0=411(x), r1=51(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 51
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
