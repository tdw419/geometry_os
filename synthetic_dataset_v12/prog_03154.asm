; DESCRIPTION: Renders a cyan disk with center (96, 170) and radius 31.
; PLAN: r0=96(x), r1=170(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 170
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
