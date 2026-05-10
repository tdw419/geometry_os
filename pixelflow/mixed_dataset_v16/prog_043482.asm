; DESCRIPTION: Places a magenta disk with center (215, 196) and radius 49.
; PLAN: r0=215(x), r1=196(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 196
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
