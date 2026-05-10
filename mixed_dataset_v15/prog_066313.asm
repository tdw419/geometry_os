; DESCRIPTION: Renders a cyan disk with center (130, 143) and radius 51.
; PLAN: r0=130(x), r1=143(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 143
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
