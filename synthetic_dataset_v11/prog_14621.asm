; DESCRIPTION: Renders a magenta disk with center (66, 130) and radius 58.
; PLAN: r0=66(x), r1=130(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 130
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
