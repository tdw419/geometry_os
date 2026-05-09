; DESCRIPTION: Renders a magenta disk with center (455, 180) and radius 16.
; PLAN: r0=455(x), r1=180(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 455
LDI r1, 180
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
