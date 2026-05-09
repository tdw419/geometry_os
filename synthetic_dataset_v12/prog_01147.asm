; DESCRIPTION: Renders a cyan disk with center (213, 110) and radius 51.
; PLAN: r0=213(x), r1=110(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 110
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
