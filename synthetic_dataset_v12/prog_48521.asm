; DESCRIPTION: Renders a cyan disk with center (210, 38) and radius 23.
; PLAN: r0=210(x), r1=38(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 38
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
