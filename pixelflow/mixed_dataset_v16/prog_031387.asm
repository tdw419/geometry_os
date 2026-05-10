; DESCRIPTION: Renders a magenta disk with center (95, 167) and radius 24.
; PLAN: r0=95(x), r1=167(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 95
LDI r1, 167
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
