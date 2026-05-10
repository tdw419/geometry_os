; DESCRIPTION: Renders a magenta disk with center (465, 210) and radius 44.
; PLAN: r0=465(x), r1=210(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 465
LDI r1, 210
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
