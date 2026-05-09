; DESCRIPTION: Places a blue circle of radius 72 at center (96, 177).
; PLAN: r0=96(x), r1=177(y), r2=72(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 177
LDI r2, 72
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
