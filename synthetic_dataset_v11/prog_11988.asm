; DESCRIPTION: Renders a cyan disk with center (199, 131) and radius 34.
; PLAN: r0=199(x), r1=131(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 131
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
