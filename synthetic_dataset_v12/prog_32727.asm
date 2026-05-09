; DESCRIPTION: Renders a cyan disk with center (87, 226) and radius 30.
; PLAN: r0=87(x), r1=226(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 226
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
