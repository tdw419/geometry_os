; DESCRIPTION: Renders a magenta disk with center (202, 162) and radius 44.
; PLAN: r0=202(x), r1=162(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 162
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
