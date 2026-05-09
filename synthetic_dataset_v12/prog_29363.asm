; DESCRIPTION: Renders a magenta disk with center (419, 214) and radius 16.
; PLAN: r0=419(x), r1=214(y), r2=16(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 419
LDI r1, 214
LDI r2, 16
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
