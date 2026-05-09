; DESCRIPTION: Places a cyan circle of radius 35 at center (131, 143).
; PLAN: r0=131(x), r1=143(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 143
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
