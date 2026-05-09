; DESCRIPTION: Places a red circle of radius 64 at center (94, 149).
; PLAN: r0=94(x), r1=149(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 149
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
