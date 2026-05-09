; DESCRIPTION: Renders a cyan disk with center (298, 196) and radius 51.
; PLAN: r0=298(x), r1=196(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 196
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
