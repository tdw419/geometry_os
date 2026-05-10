; DESCRIPTION: Places a cyan disk with center (262, 90) and radius 14.
; PLAN: r0=262(x), r1=90(y), r2=14(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 90
LDI r2, 14
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
