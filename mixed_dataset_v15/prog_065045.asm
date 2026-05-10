; DESCRIPTION: Renders a cyan disk with center (336, 44) and radius 40.
; PLAN: r0=336(x), r1=44(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 336
LDI r1, 44
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
