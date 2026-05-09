; DESCRIPTION: Renders a magenta disk with center (53, 57) and radius 27.
; PLAN: r0=53(x), r1=57(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 57
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
