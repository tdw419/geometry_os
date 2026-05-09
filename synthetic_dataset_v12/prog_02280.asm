; DESCRIPTION: Renders a cyan disk with center (56, 121) and radius 19.
; PLAN: r0=56(x), r1=121(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 121
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
