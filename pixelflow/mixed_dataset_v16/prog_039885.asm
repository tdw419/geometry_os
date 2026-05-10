; DESCRIPTION: Renders a cyan disk with center (93, 209) and radius 26.
; PLAN: r0=93(x), r1=209(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 209
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
