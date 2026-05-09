; DESCRIPTION: Renders a cyan disk with center (380, 75) and radius 19.
; PLAN: r0=380(x), r1=75(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 75
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
