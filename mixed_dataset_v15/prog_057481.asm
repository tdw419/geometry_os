; DESCRIPTION: Renders a cyan disk with center (247, 137) and radius 50.
; PLAN: r0=247(x), r1=137(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 137
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
