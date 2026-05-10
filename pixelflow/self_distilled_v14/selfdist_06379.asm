; DESCRIPTION: Places a cyan disk with center (215, 51) and radius 34.
; PLAN: r0=215(x), r1=51(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 51
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
