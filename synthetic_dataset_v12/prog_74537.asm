; DESCRIPTION: Renders a magenta disk with center (362, 149) and radius 26.
; PLAN: r0=362(x), r1=149(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 149
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
