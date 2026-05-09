; DESCRIPTION: Renders a cyan disk with center (430, 92) and radius 64.
; PLAN: r0=430(x), r1=92(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 92
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
