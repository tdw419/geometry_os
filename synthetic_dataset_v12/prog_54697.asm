; DESCRIPTION: Places a cyan circle of radius 20 at center (467, 223).
; PLAN: r0=467(x), r1=223(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 467
LDI r1, 223
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
