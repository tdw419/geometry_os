; DESCRIPTION: Renders a cyan disk with center (51, 141) and radius 38.
; PLAN: r0=51(x), r1=141(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 51
LDI r1, 141
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
