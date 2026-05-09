; DESCRIPTION: Renders a cyan disk with center (177, 72) and radius 69.
; PLAN: r0=177(x), r1=72(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 72
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
