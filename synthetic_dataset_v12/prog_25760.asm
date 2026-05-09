; DESCRIPTION: Renders a cyan disk with center (177, 103) and radius 50.
; PLAN: r0=177(x), r1=103(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 103
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
