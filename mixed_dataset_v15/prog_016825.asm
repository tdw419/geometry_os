; DESCRIPTION: Places a cyan disk with center (193, 200) and radius 53.
; PLAN: r0=193(x), r1=200(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 200
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
