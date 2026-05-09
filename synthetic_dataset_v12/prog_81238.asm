; DESCRIPTION: Renders a magenta disk with center (59, 167) and radius 54.
; PLAN: r0=59(x), r1=167(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 167
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
