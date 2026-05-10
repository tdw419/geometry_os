; DESCRIPTION: Renders a cyan disk with center (378, 101) and radius 42.
; PLAN: r0=378(x), r1=101(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 101
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
