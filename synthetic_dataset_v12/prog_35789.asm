; DESCRIPTION: Renders a cyan disk with center (380, 117) and radius 73.
; PLAN: r0=380(x), r1=117(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 117
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
