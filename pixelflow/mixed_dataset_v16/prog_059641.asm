; DESCRIPTION: Renders a cyan disk with center (324, 87) and radius 12.
; PLAN: r0=324(x), r1=87(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 87
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
