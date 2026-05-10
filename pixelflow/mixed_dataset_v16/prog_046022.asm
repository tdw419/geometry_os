; DESCRIPTION: Renders a magenta disk with center (205, 180) and radius 64.
; PLAN: r0=205(x), r1=180(y), r2=64(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 180
LDI r2, 64
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
