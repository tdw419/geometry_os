; DESCRIPTION: Places a cyan disk with center (97, 199) and radius 79.
; PLAN: r0=97(x), r1=199(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 199
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
