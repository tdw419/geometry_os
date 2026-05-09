; DESCRIPTION: Renders a cyan disk with center (294, 158) and radius 76.
; PLAN: r0=294(x), r1=158(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 158
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
