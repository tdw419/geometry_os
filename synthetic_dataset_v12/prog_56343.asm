; DESCRIPTION: Renders a cyan disk with center (406, 102) and radius 20.
; PLAN: r0=406(x), r1=102(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 102
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
