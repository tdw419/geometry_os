; DESCRIPTION: Renders a cyan circular shape at (356, 136) with radius 56.
; PLAN: r0=356(x), r1=136(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 136
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
