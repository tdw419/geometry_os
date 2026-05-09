; DESCRIPTION: Renders a cyan disk with center (172, 153) and radius 55.
; PLAN: r0=172(x), r1=153(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 153
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
