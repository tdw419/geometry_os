; DESCRIPTION: Renders a magenta disk with center (150, 38) and radius 31.
; PLAN: r0=150(x), r1=38(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 38
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
