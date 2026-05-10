; DESCRIPTION: Renders a magenta disk with center (303, 148) and radius 25.
; PLAN: r0=303(x), r1=148(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 303
LDI r1, 148
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
