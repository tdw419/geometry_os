; DESCRIPTION: Renders a red disk with center (64, 48) and radius 20.
; PLAN: r0=64(x), r1=48(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 48
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
