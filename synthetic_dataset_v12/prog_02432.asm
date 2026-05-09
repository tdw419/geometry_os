; DESCRIPTION: Renders a magenta disk with center (435, 154) and radius 49.
; PLAN: r0=435(x), r1=154(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 154
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
