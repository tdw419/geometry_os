; DESCRIPTION: Renders a magenta disk with center (180, 193) and radius 28.
; PLAN: r0=180(x), r1=193(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 193
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
