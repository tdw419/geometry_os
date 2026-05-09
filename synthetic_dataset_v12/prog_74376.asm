; DESCRIPTION: Renders a cyan disk with center (212, 139) and radius 39.
; PLAN: r0=212(x), r1=139(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 139
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
