; DESCRIPTION: Renders a cyan disk with center (64, 191) and radius 10.
; PLAN: r0=64(x), r1=191(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 191
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
