; DESCRIPTION: Renders a magenta disk with center (16, 202) and radius 15.
; PLAN: r0=16(x), r1=202(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 16
LDI r1, 202
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
