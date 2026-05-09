; DESCRIPTION: Renders a magenta disk with center (57, 58) and radius 16.
; PLAN: r0=57(x), r1=58(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 58
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
