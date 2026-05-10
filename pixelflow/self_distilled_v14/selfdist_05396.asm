; DESCRIPTION: Places a cyan disk with center (221, 134) and radius 73.
; PLAN: r0=221(x), r1=134(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 134
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
