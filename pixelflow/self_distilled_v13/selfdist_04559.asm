; DESCRIPTION: Places a cyan disk with center (204, 141) and radius 79.
; PLAN: r0=204(x), r1=141(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 141
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
