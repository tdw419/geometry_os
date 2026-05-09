; DESCRIPTION: Renders a cyan disk with center (336, 162) and radius 55.
; PLAN: r0=336(x), r1=162(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 162
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
