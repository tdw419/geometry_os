; DESCRIPTION: Renders a magenta disk with center (156, 167) and radius 68.
; PLAN: r0=156(x), r1=167(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 167
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
