; DESCRIPTION: Renders a cyan disk with center (250, 98) and radius 28.
; PLAN: r0=250(x), r1=98(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 98
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
