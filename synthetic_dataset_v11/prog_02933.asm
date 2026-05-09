; DESCRIPTION: Renders a cyan disk with center (122, 51) and radius 32.
; PLAN: r0=122(x), r1=51(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 51
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
