; DESCRIPTION: Renders a cyan disk with center (19, 121) and radius 19.
; PLAN: r0=19(x), r1=121(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 19
LDI r1, 121
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
