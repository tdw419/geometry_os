; DESCRIPTION: Renders a magenta disk with center (290, 177) and radius 60.
; PLAN: r0=290(x), r1=177(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 177
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
