; DESCRIPTION: Renders a cyan disk with center (379, 124) and radius 61.
; PLAN: r0=379(x), r1=124(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 379
LDI r1, 124
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
