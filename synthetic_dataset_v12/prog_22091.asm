; DESCRIPTION: Renders a cyan disk with center (98, 175) and radius 47.
; PLAN: r0=98(x), r1=175(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 175
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
