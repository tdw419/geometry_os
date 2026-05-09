; DESCRIPTION: Renders a cyan disk with center (322, 153) and radius 75.
; PLAN: r0=322(x), r1=153(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 322
LDI r1, 153
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
