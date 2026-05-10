; DESCRIPTION: Places a cyan circle of radius 79 at center (223, 142).
; PLAN: r0=223(x), r1=142(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 142
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
