; DESCRIPTION: Renders a cyan disk with center (55, 38) and radius 30.
; PLAN: r0=55(x), r1=38(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 38
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
