; DESCRIPTION: Places a cyan circle of radius 61 at center (131, 180).
; PLAN: r0=131(x), r1=180(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 180
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
