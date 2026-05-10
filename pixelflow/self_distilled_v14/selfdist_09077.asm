; DESCRIPTION: Places a cyan disk with center (262, 94) and radius 45.
; PLAN: r0=262(x), r1=94(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 94
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
