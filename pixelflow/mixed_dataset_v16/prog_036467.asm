; DESCRIPTION: Places a white circle of radius 27 at center (356, 136).
; PLAN: r0=356(x), r1=136(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 136
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
