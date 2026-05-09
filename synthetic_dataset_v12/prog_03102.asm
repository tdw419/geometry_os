; DESCRIPTION: Renders a cyan disk with center (219, 129) and radius 51.
; PLAN: r0=219(x), r1=129(y), r2=51(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 219
LDI r1, 129
LDI r2, 51
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
