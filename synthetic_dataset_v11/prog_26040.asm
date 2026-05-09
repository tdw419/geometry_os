; DESCRIPTION: Renders a magenta disk with center (91, 149) and radius 73.
; PLAN: r0=91(x), r1=149(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 149
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
