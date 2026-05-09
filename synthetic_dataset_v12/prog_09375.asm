; DESCRIPTION: Renders a magenta disk with center (266, 154) and radius 68.
; PLAN: r0=266(x), r1=154(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 154
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
