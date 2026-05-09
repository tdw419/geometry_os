; DESCRIPTION: Renders a cyan disk with center (200, 82) and radius 47.
; PLAN: r0=200(x), r1=82(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 200
LDI r1, 82
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
